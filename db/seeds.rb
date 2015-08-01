# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pw = 'password'

50.times do
  User.create(login: Faker::Internet.user_name, password: pw, password_confirmation: pw)
end

(1..50).each do |n|
  rand(5).times do
    new_dest = "#{Faker::Address.city}, #{Faker::Address.state}"
    TripPlan.create(title: new_dest, user_id: n)
  end
end

User.create(login: "Guest_User", password: pw, password_confirmation: pw)
