# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

n=1
m=n+2
20.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Japanese::Name.name
  user = User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: n+2,
               provider: m+1,
               )

  topic = Topic.create(
          title: "あああ",
          content: "えええ",
          user_id: user.id
          )

  comment = Comment.create(
            content: "おおお",
            user_id: user.id,
            topic_id: topic.id
            )

end

# n = 1
# while n <= 20
#   Topic.create(
#     title: "あああ",
#     content: "えええ",
#     user_id: n
#   )
#   n = n + 1
#
#
# end
#
# n = 1
# while n <= 20
#   Comment.create(
#     content: "おおお",
#     user_id: n,
#     topic_id: n
#   )
#   n = n + 1
# end
