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
end

u = User.new(
	name: 'tester',
		email: 'test@email.com',
		password: 'password',
		password_confirmation: 'password')
u.save
u.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{User.count} users created"