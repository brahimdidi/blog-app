# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1000.times do 
  @title = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  @text = (0...189).map { ('a'..'z').to_a[rand(26)] }.join
  @user_id  = rand(1..3)
  Post.create(title: @title, text: @text, user_id: @user_id )
end