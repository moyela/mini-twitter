User.create!(display_name:  "Wemi Moyela (Admin)", 
             username: "moyela",
             email: "wemymoyela@gmail.com", 
             admin: true,
             password:              "password", 
             password_confirmation: "password") 
 
 99.times do |n| 
    
    display_name = Faker::Name.name 
    username = display_name[0..10].downcase.gsub(" ", "") + "#{n+1}"
    email = "example-#{n+1}@railstutorial.org" 
    password = "password"

    User.create!(display_name: display_name, 
                username: username,
                email: email,
                password:              password, 
                password_confirmation: password)
 end


users = User.order(:created_at).take(6)

50.times do 
    content = Faker::Lorem.sentence(word_count: 5) 
    users.each { |user| user.tweets.create!(content: content) }
end

users = User.all

# Create a more random distribution of followers/following
users.each do |user|
  # Choose a random number of users to follow (between 0 and all other users)
  number_of_users_to_follow = rand(0..users.count - 1)

  # Select random users to follow (excluding the current user)
  users_to_follow = (users - [user]).sample(number_of_users_to_follow)

  users_to_follow.each do |user_to_follow|
    user.follow(user_to_follow)
  end
end