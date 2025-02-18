class TweetsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: [:destroy ]

    def create 
        @tweet = current_user.tweets.build(tweet_params)

        if @tweet.save 
            flash[:success] = "You posted a tweet!" 
            redirect_to root_url 
        else 
            @feed_items = current_user.feed.paginate(page: params[:page]) 
            render 'static_pages/home', status: :unprocessable_entity 
        end

    end

    def destroy
        @tweet.destroy 
        flash[:success] = "Micropost deleted" 
        if request.referrer.nil? || request.referrer == tweets_url
            redirect_to root_url, status: :see_other
        else
            redirect_to request.referrer, status: :see_other
        end 
    end

    private
        def tweet_params
            params.require(:tweet).permit(:content)
        end

        def correct_user
            @tweet = current_user.tweets.find_by(id: params[:id])
            redirect_to root_url, status: :see_other if @tweet.nil?
        end
end
