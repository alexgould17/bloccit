require 'random_data'

50.times { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

upost = Post.find_or_create_by!(title: "Unique Post", body: "Unique test post.")
posts = Post.all
100.times { Comment.create!(post: posts.sample, body: RandomData.random_paragraph) }
Comment.find_or_create_by!(post: upost, body: "Unique test comment.")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
