require "random_data"

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 10.times do
   Advertisement.create!(
     title: RandomData.random_sentence,
     copy: RandomData.random_paragraph,
     price: 50
   )
 end

 Post.find_or_create_by(title: "unique title", body: "unique body")
 Advertisement.find_or_create_by(title: "Rocksbox", copy: "Rent unlimited designer jewelry every month for a very low price!", price: 19)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} ads created"
