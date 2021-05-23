desc "Fill the database tables with some sample data"

task({ :sample_data => :environment}) do
  require 'faker'

  User.destroy_all
  Contact.destroy_all
  Group.destroy_all
  Membership.destroy_all

  #Create Users
  user = User.new
  user.email = "bob@example.com"
  user.password = "password"
  user.save

  user = User.new
  user.email = "alice@example.com"
  user.password = "password"
  user.save

  #Create Contacts

  120.times do
   contact = Contact.new
   contact.name = Faker::Name.first_name
   contact.last_name = Faker::Name.last_name
   contact.phone_number = Faker::PhoneNumber.cell_phone
   contact.communication_channel = ["SMS","Facebook","Whatsapp",'Telegram'].sample
   contact.user_id = User.all.sample.id
   contact.email = "#{Faker::Name.first_name}@example.com"
   contact.organization = Faker::Creature::Animal.name
   contact.facebook = Faker::Internet.url
   contact.instagram = Faker::Internet.url
   contact.twitter = Faker::Twitter.screen_name
   contact.save
  end

  #Create groups

  6.times do
    group = Group.new
    group.group_name = Faker::Movie.title
    group.user_id = User.all.sample.id
    group.save
  end

  #Create memberships

  Group.all.each do |group|
    30.times do
      membership = group.memberships.create(contact: Contact.all.sample)
      p membership.errors.full_messages
    end
  end

  p "You have created #{User.all.count} users"
  p "You have created #{Contact.all.count} contacts"
  p "You have created #{Group.all.count} groups"
  p "You have created #{Membership.all.count} memberships"

end