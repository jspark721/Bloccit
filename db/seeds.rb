require 'random_data'
require 'faker'

# Create Users
5.times do
  User.create!(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   "password",
    password_confirmation: "password"
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         Faker::Hipster.words(rand(1..10)).join(" "),
    description:  Faker::Hipster.paragraph(rand(1..4))
  )
end
topics = Topic.all

50.times do
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Hipster.words(rand(5..10)).join(" "),
    body:   Faker::Hipster.paragraph(rand(1..3))
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

posts = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Hipster.paragraph
   )
  end

Post.find_or_create_by(title: "unique title", body: "unique body")

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
