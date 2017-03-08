# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Remise à zéro de la base existante
require "faker"

Order.delete_all
Product.delete_all
Profile.delete_all
User.delete_all

# Creation de l'artiste

myartistuser = User.new(email:'toto@gmail.com')
myartistuser.password = 'test123'
myartistuser.save!

myuser2 = User.new(email:'carole@gmail.com')
myuser2.password = 'password'
myuser2.save!

# Création de plusieurs artists a partir de seed

# artists_list = Services::Scrapper.new.scrap_artsy_all
artists_list = ["Federico-Herrero", "Andrea-Mary-Marshall", "Julius-von-Bismarck", "Wyatt-Kahn", "Huang-Xu", "Zhang-Xiang-Min", "Jitish-Kallat", "Lee-Jeonglok", "Kahn-&-Selesnick", "Janet-Delaney", "Donald-Judd", "Joseph-Kosuth", "Gabriel-Rosas-Alemán", "Pascale-Marthine-Tayou", "Carol-Rama", "Robert-Frank", "Johannes-Nagel", "Masanori-Umeda", "Chris-Wolston", "Jorge-Pardo", "Robert-Indiana", "Gordon-Parks", "Louise-Bourgeois", "Joseph-Kosuth", "Hugo-Lugo", "Carlos-Amorales", "Charles-Gaines", "Rudolf-Stingel", "Keith-Haring", "Meyer-Vaisman", "Jenny-Holzer", "Tseng-Kwong-Chi"]

artists_list.each do |artist|

      html_file = open("https://www.artsy.net/artist/#{artist}")
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('.artist-header-name').each do |element|
        prenom = element.text.split.first
        a = element.text.split
        a.shift
        nom = a.join(" ")
        user1 = User.new(email: Faker::Internet.email, password: Faker::PhoneNumber.subscriber_number(7))
        user1.save!
        artist = Profile.new(firstname: prenom, lastname: nom)
        artist.user = user1
        artist.save!

      end
    end
     #  html_doc.search('.blurb').each do |element|
      # description = element.text
      #  end

      # { name: name, description: description }



# Creation du profile

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
