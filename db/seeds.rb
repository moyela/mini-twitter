User.create!(display_name:  "Wemi Moyela (Admin)", 
             username: "moyela",
             email: "wemymoyela@gmail.com", 
             admin: true,
             password:              "password", 
             password_confirmation: "password") 
 
 29.times do |n| 
    
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


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
