require 'faker'

rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.skip_confirmation!
  u.save

  rand(1..3).times do
    p = u.posts.create(
      title: Faker::Lorem.words(rand(1..10)).join(" "))
    # set the created_at to a time within the past year
    p.update_attribute(:created_at, Time.now - rand(600..31536000))
  end
end

post_count = Post.count
User.all.each do |user|
  rand(10..15).times do
    p = Post.find(rand(1..post_count))
    c = user.comments.create(
      body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"),
      post: p)
    c.update_attribute(:created_at, Time.now - rand(600..31536000))
  end
end


u = User.new(
	name: 'tester',
		email: 'test@email.com',
		password: 'password',
		password_confirmation: 'password')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{User.count} users created"