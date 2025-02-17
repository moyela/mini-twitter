module SessionsHelper
    # Logs in the given user. 
    def log_in(user) 
        session[:user_id] = user.id 
         # Guard against session replay attacks.
        # See https://bit.ly/33UvK0w for more.
        # session[:session_token] = user.session_token 
    end

    def log_out
        reset_session
        @current_user = nil
    end

    # returns the current logged-in user if any, only hits the db once
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def current_user?(user)
    # Returns true if the given user is the current user
        user && user == current_user
    end 

    def logged_in?
    # true if user is logged in
        !current_user.nil?
    end

    def store_location 
        session[:forwarding_url] = request.original_url if request.get? 
    end
end
