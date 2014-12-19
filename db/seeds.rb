# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Example User",
email: "example@example.com",
password: "example",
password_confirmation: "example")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "example"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password)
end

# Redditposts
users = User.all
50.times do |n|
  title = "outside? #{n} wow i got high score?"
  content = "http://www.reddit.com/r/outside"
  redditpost = users.sample.redditposts.create(content: content, title: title)
  redditpost.score = 0
  redditpost.save
end
