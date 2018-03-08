# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  pw = Faker::Internet.password
  user = User.new

  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = pw
  user.password_confirmation = pw

  user.skip_confirmation!
  user.save!
end

users = User.all

1.times do
  user = User.new

  user.name = 'Kolby Kalafut'
  user.email = 'kolbykalafut@gmail.com'
  user.password = 'password'
  user.password_confirmation = 'password'

  user.skip_confirmation!
  user.save!
end

1.times do
  user = User.new

  user.name = 'Kolby Kalafut'
  user.email = 'kolbykalafut1@gmail.com'
  user.password = 'password'
  user.password_confirmation = 'password'

  user.skip_confirmation!
  user.save!
end

50.times do
  Wiki.create!([{
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false
    }])
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
