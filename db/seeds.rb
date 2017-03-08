# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Remise à zéro de la base existante

Order.delete_all
Product.delete_all
Profile.delete_all
User.delete_all

# Creation des users

myadmin = User.new(email:'admin@admin.com')
myadmin.password = 'adminadmin'
myadmin.admin = true
myadmin.save!

myartistuser = User.new(email:'toto@gmail.com')
myartistuser.password = 'test123'
myartistuser.save!

myuser2 = User.new(email:'carole@gmail.com')
myuser2.password = 'password'
myuser2.save!


# Creation des profiles

myartist = Profile.new(profile_type: 'artist', firstname: 'toto', lastname: 'zero', picture: 'default_pic', country: 'FR', universe_name: 'la tete a toto', universe_picture: 'default_pic')
myartist.user = myartistuser
myartist.save!

myclient = Profile.new(profile_type: 'client', firstname: 'carole', lastname: 'bouquet', picture: 'default_pic', country: 'FR')
myclient.user = myuser2
myclient.save!

#Creation de l’order

myorder = Order.new(status: 'purchase_request')
myorder.user = (Profile.find_by firstname:'carole').user
myorder.artist = (Profile.find_by firstname:'toto').user
myorder.save!

#Creation de product

myproduct = Product.new(name: 'bijou', description:'desc', picture:'default_pic', price:2.50)
myproduct.user = (Profile.find_by firstname:'toto').user
myproduct.save!
