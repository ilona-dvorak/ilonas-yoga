# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

User.destroy_all
Yogaclass.destroy_all

puts "Creating users..."

# Students
@user_one = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_two = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_three = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_four = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_five = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_six = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Student", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
# Teachers
@user_seven = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Teacher", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_eight = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Teacher", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_nine = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Teacher", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
@user_ten = User.create!(email: Faker::Internet.email, password: "12345678", user_type: "Teacher", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

puts "#{User.count} users created successfully."

puts "Now creating yogaclasses..."

TYPES = ['Yoga-Beginner', 'Yoga-Intermediate', 'Yoga-Advanced', 'Pilates-Beginner', 'Pilates-Intermediate', 'Pilates-Advanced']
DURATION = [0.5, 1, 1.5, 2]

@yoga_one = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_one.user = @user_seven
@yoga_one.save!

puts "Created #{@yoga_one.title}!"

@yoga_two = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_two.user = @user_seven
@yoga_two.save!

puts "Created #{@yoga_two.title}!"

@yoga_three = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_three.user = @user_eight
@yoga_three.save!

puts "Created #{@yoga_three.title}!"

@yoga_four = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_four.user = @user_eight
@yoga_four.save!

puts "Created #{@yoga_four.title}!"

@yoga_five = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_five.user = @user_nine
@yoga_five.save!

puts "Created #{@yoga_five.title}!"

@yoga_six = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_six.user = @user_nine
@yoga_six.save!

puts "Created #{@yoga_six.title}!"

@yoga_seven = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_seven.user = @user_ten
@yoga_seven.save!

puts "Created #{@yoga_seven.title}!"

@yoga_eight = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample
)
@yoga_eight.user = @user_ten
@yoga_eight.save!

puts "Created #{@yoga_eight.title}!"

puts "All seeds are created!"
