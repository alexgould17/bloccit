require 'random_data'

# Our standard test password, admin email & test arrays: users, topics & posts
test_users = []
test_topics = []
test_posts = []
test_pw = "wsxedc"
admin_email = "admin@test.test"

# Create our test users: 1 admin & 5 standard users
test_users << User.find_or_create_by(email: admin_email) do |admin|
  admin.name = "Test Admin"
  admin.password = test_pw
  admin.role = :admin
end
5.times do
  test_users << User.create!(
    name: Faker::DragonBall.unique.character,
    email: Faker::Internet.unique.safe_email,
    password: test_pw
  )
end
# Create our test bloccit data, 15 topics, 50 posts, 100 comments & 0-10 votes for each comment.
15.times do
  test_topics << Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
50.times do
  test_posts << Post.create!(
    user: test_users.sample,
    topic: test_topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  test_posts.last.update_attribute(:created_at, rand(10.minutes..1.year).ago)
  rand(0..10).times do
    test_posts.last.votes.create!(value: [-1, 1].sample, user: test_users.sample)
  end
end
posts = Post.all
100.times do
  Comment.create!(
    post: test_posts.sample,
    body: RandomData.random_paragraph,
    user: test_users.sample
  )
end

puts "Seeding finished"
puts "#{User.count} users in the database."
puts "#{Topic.count} topics in the database."
puts "#{Post.count} posts in the database."
puts "#{Comment.count} comments in the database."
puts "#{Vote.count} votes in the database."
