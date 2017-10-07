# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'amanda@ga.co', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Amanda', :location => 'Sydney', :userPhoto => 'https://www.unitedwaynorman.org/sites/unitedwaynorman.org/files/cutepuppy.jpg', :admin => true
u2 = User.create :email => 'anna@ga.co', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Anna', :location => 'Japan', :userPhoto => 'https://www.unitedwaynorman.org/sites/unitedwaynorman.org/files/cutepuppy.jpg'
