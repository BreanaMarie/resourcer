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


  1.times do

    new_profile = Profile.new
    new_profile.firstname = FFaker::Name.name
    new_profile.lastname = FFaker::Name.name
    new_profile.address = FFaker::Address.street_address
    new_profile.city = FFaker::Address.city
    new_profile.state = FFaker::AddressUS.state
    new_profile.phone = FFaker::PhoneNumber.short_phone_number
    new_profile.image = FFaker::Avatar.image
    new_profile.bio = FFaker::Lorem.paragraph(3)

    new_profile.save
    new_user.profile = new_profile


    3.times do
      new_employment = Employment.new
      new_employment.industry = FFaker::Education.major
      new_employment.title = FFaker::Company.position
      new_employment.company = FFaker::Company.name
      new_employment.city = FFaker::Address.city
      new_employment.state = FFaker::AddressUS.state
      new_employment.summary = FFaker::HipsterIpsum.paragraphs(3)
      new_employment.startdate = FFaker::Time.date
      new_employment.enddate = FFaker::Time.date

      new_employment.save
      new_profile.employments.push new_employment
    end
  end
end