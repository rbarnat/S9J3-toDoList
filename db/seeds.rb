# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'

Task.destroy_all
Email.destroy_all

3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward(23),
                      image: Faker::Avatar.image)
    my_task.category = my_category
    my_task.save
  end
end

15.times do
  # sentence_array = Faker::Lorem.paragraph(sentence_count: 20)
  # my_body = ""
  # sentence_array.each {|s| my_body += s}
  # puts my_body
  my_body = Faker::Lorem.paragraph
  my_mail = Email.new(object: Faker::Book.title,
                      body: my_body,
                      read: [true, false].sample)
  my_mail.save
end
