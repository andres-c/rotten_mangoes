require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create( email: 'admin@aol.com', password: 'admin', password_confirmation: 'admin',  firstname: 'Mr.Admin', lastname: 'admin',  is_admin: true)

100.times do
faker_confirmation_password = Faker::Internet.password
User.create!(
  :email => Faker::Internet.email,
  :password => faker_confirmation_password,
  :password_confirmation => faker_confirmation_password,
  :firstname => Faker::Name.first_name,
  :lastname => Faker::Name.last_name
  )
end