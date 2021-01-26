# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

User.destroy_all
Yogaclass.destroy_all

puts "Creating users..."

@user_one = User.new(email: "malin@me.org", password: "12345678")

puts "Creating yogaclasses..."

@yoga_one = Yogaclass.create!(title: "Yoga in the Park", price: "10 Euros", class_type: "Yoga-Beginner", address: "Wiener Stadtpark, Parkring 1, 1010 Wien, Austria", duration: 0.45)
@yoga_one.user = @user_one

puts "Created #{@yoga_one.title}!"
