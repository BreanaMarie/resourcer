# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'ffaker' 

20.times do 

  # create the user params
  user_params = Hash.new
  user_params[:password]  = "12345"
  user_params[:email] = FFaker::Internet.email
  new_user = User.create(user_params)
  p new_user
  p new_user.id
  puts new_user.email

  1.times do

    new_profile = Profile.new
    profile_params[:firstname] = FFaker::Name.name
    profile_params[:lastname] = FFaker::Name.name
    profile_params[:address] = Faker::Address.street_address
    profile_params[:city] = FFaker::Address.city
    profile_params[:state] = FFaker::AddressUS.state
    profile_params[:phone] = Faker::PhoneNumber.short_phone_number
    profile_params[:image] = FFaker::Avatar.image
    profile_params[:bio] = FFaker::Lorem.paragraph(3)

    new_profile.save
    new_user.profile.push new_profile
  end

end