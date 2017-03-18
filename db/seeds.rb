require 'random_data'
5.times { User.create!(name: RandomData.random_name, email: RandomData.random_email, password: RandomData.random_sentence) }
admin = User.create!(name: "Alex Gould", email: "alexgould17@gmail.com", password: "123456", role: :admin)
member = User.create!(name: "Test Member", email: "member@example.com", password: "123456")
users = User.all
15.times { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
topics = Topic.all
50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all
100.times { Comment.create!(post: posts.sample, body: RandomData.random_paragraph, user: users.sample) }

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
