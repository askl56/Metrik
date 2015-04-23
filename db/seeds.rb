# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

app = RegisteredApplication.create(name: Faker::App.name, url: "http://example.com")

10.times do
  payload1 = {referer: Faker::Internet.domain_name, ip_address: Faker::Internet.ip_v6_address}
  Event.create(name: Faker::Hacker.noun, registered_application: app, payload: payload1)
end
