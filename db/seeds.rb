# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# seed test user
test_user = User.where(email: 'test@example.com').first
test_user = User.create(name: 'Test User', email: 'test@example.com', password: 'changeme') unless test_user

# seed registered_applications
5.times do
  RegisteredApplication.create(
    user: test_user,
    name: Faker::Name.name,
    url: Faker::Internet.url
  )
end
apps = RegisteredApplication.all

# seed events
event_types = %w(view click scroll)
100.times do
  Event.create(
    registered_application: apps.sample,
    name: event_types.sample
  )
end
