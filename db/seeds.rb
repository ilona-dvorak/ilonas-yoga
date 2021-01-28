# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Yogaclass.destroy_all

puts "Creating yogaclasses..."

@yoga_one = Yogaclass.create(title: "Yoga in the Park", price: "10 Euros", address: "Wiener Stadtpark, Parkring 1, 1010 Wien, Austria", duration: 0.45)

puts "Created #{@yoga_one.title}!"
