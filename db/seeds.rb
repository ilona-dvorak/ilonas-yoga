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

Review.destroy_all
puts "Reviews are deleted"

Booking.destroy_all
puts "Bookings are deleted"

Yogaclass.destroy_all
puts "Yogaclasses are deleted"

User.destroy_all
puts "Users are deleted"

puts "Creating users..."

user_types = %w(Student Teacher)
password = 123456

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: password,
    user_type: user_types.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
  user.save!
  puts "Creating user nr. #{user.id}"
end

puts "#{User.count} users created successfully."

puts "Now creating yogaclasses..."

class_types = %w(Yoga-Beginner Yoga-Intermediate Yoga-Advanced Pilates-Beginner Pilates-Intermediate Pilates-Advanced)
addresses = ["Mannheim, Germany", "Cologne, Germany", "Berlin, Germany", "Munich, Germany", "Düsseldorf, Germany", "Hamburg, Germany", "Bielefeld, Germany", "Leipzig, Germany", "Stuttgart, Germany", "Kassel, Germany"]

20.times do
  yoga_class = Yogaclass.new(
    title: "Yoga at #{Faker::Address.community}",
    description: Faker::Quote.matz,
    price: "#{rand(10..20)}",
    class_type: class_types.sample,
    address: addresses.sample,
    duration: [0.5, 1, 1.5, 2].sample,
    start_at: Time.now + 2.days
  )
  yoga_class.user = User.where(user_type: "Teacher").sample
  yoga_class.save!
  puts "Creating Yoga class nr. #{yoga_class.id}"
end

puts "Created #{Yogaclass.count} yoga classes!"

puts "Time to upload images"

avatar_urls = %w(https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/ph_wzfnem.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/yg_wyzx3r.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/ob_tdubwy.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/ms_ji35rf.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/kku_givbng.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/mm_gdudto.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610549/avatars/ch_zeddj4.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610550/avatars/lg_jg9bag.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610549/avatars/id_y0gn6z.jpg
                 https://res.cloudinary.com/byktzgl/image/upload/v1612610549/avatars/kkl_eofqy9.jpg
)

photo_urls = %w(https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-1_tgvuyh.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014734/yoga-2_zslapu.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-3_jcgis9.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-4_etjz8z.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-5_ujul32.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-6_lba8gf.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-7_hl5exw.jpg
                https://res.cloudinary.com/byktzgl/image/upload/v1612014733/yoga-8_ie7lwe.jpg
)

# user_avatar = URI.open(avatar_urls.sample)
avatar_names = %w(avatar_one avatar_two avatar_three avatar_four avatar_five avatar_six avatar_seven avatar_eight avatar_nine avatar_ten)
User.all.each do |user|
  x = 0
  user.photo.attach(io: URI.open(avatar_urls.sample), filename: "#{avatar_names[x]} image", content_type: 'image/jpeg')
  x += 1
end

puts "user images are uploaded"

# yoga_photo = URI.open(photo_urls.sample)
photo_names = %w(photo_one photo_two photo_three photo_four photo_five photo_six photo_seven photo_eight photo_nine photo_ten)
Yogaclass.all.each do |yoga|
  x = 0
  yoga.photo.attach(io: URI.open(photo_urls.sample), filename: "#{photo_names[x]} image", content_type: 'image/jpeg')
  x += 1
end

puts "yoga class images are uploaded"


puts "Now adding reviews to the yoga classes"

all_classes = Yogaclass.all
all_classes.each do |yogaclass|
  5.times do
    review = Review.new(
      content: Faker::Quotes::Shakespeare.as_you_like_it_quote
    )
    yogaclass.reviews << review
    yogaclass.save!
  end
end

puts "Reviews are there!"

puts "So, all seeds are created, well done!"
