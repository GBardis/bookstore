# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
def time_rand(from = 0.0, to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f))
end

15.times do
  author = Faker::Book.author.split(' ')
  Author.create(email: Faker::Internet.unique.email, first_name: author.first, last_name: author.second, date_of_birth: time_rand)
end

5.times do
  Publisher.create(name: Faker::Book.unique.publisher, telephone: Faker::PhoneNumber.phone_number, address: Faker::Address.full_address)
end

authors = Author.all
publishers = Publisher.all
50.times do
  Book.create(title: Faker::Book.unique.title, description: Faker::Lorem.unique.paragraphs(2).join(' '), isbn: Faker::Code.unique.isbn, visibility: [0, 1].sample, creation_date: time_rand, authors: [authors.sample], publisher_id: publishers.sample.id)
end
