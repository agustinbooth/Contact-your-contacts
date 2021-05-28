desc "Fill the database tables with some sample data"

task({ :sample_data => :environment}) do

  User.destroy_all
  Contact.destroy_all
  Group.destroy_all
  Membership.destroy_all

  #Create Users
  User.create(email: "bob@example.com", password: "password")
  User.create(email: "alice@example.com", password: "password")

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

  30.times do
    membership = Membership.new
    membership.group_id = Group.all[0].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

  30.times do
    membership = Membership.new
    membership.group_id = Group.all[1].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

  30.times do
    membership = Membership.new
    membership.group_id = Group.all[2].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

    30.times do
    membership = Membership.new
    membership.group_id = Group.all[3].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

    30.times do
    membership = Membership.new
    membership.group_id = Group.all[4].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

    30.times do
    membership = Membership.new
    membership.group_id = Group.all[5].id
    membership.contact_id = Contact.all.sample.id
    membership.save
    p membership.errors.full_messages
  end

  p "You have created #{User.all.count} users"
  p "You have created #{Contact.all.count} contacts"
  p "You have created #{Group.all.count} groups"
  p "You have created #{Membership.all.count} memberships"

end