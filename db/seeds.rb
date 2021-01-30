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
  duration: DURATION.sample,
  start_at: Time.now + 1.days
)
@yoga_one.user = @user_seven
# @yoga_one.photo.key = Y
@yoga_one.save!

puts "Created #{@yoga_one.title}!"

@yoga_two = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 2.days
)
@yoga_two.user = @user_seven
# @yoga_two.photo.key = "yoga-6_lba8gf"
@yoga_two.save!

puts "Created #{@yoga_two.title}!"

@yoga_three = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 2.days
)
@yoga_three.user = @user_eight
# @yoga_three.photo.key = "yoga-8_ie7lwe"
@yoga_three.save!

puts "Created #{@yoga_three.title}!"

@yoga_four = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 3.days
)
@yoga_four.user = @user_eight
# @yoga_four.photo.key = "yoga-5_ujul32"
@yoga_four.save!

puts "Created #{@yoga_four.title}!"

@yoga_five = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 3.days
)
@yoga_five.user = @user_nine
# @yoga_five.photo.key = "yoga-4_etjz8z"
@yoga_five.save!

puts "Created #{@yoga_five.title}!"

@yoga_six = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 4.days
)
@yoga_six.user = @user_nine
# @yoga_six.photo.key = "yoga-7_hl5exw"
@yoga_six.save!

puts "Created #{@yoga_six.title}!"

@yoga_seven = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 4.days
)
@yoga_seven.user = @user_ten
# @yoga_seven.photo.key = "yoga-3_jcgis9"
@yoga_seven.save!

puts "Created #{@yoga_seven.title}!"

@yoga_eight = Yogaclass.new(
  title: "Yoga at #{Faker::Address.community}",
  description: Faker::Lorem.paragraph_by_chars,
  price: "#{rand(10..20)}",
  class_type: TYPES.sample,
  address: Faker::Address.full_address,
  duration: DURATION.sample,
  start_at: Time.now + 5.days
)
@yoga_eight.user = @user_ten
# @yoga_eight.photo.key = "yoga-2_zslapu"
@yoga_eight.save!

puts "Created #{@yoga_eight.title}!"

puts "All seeds are created!"
