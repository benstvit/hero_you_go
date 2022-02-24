require "open-uri"
require 'faker'

Review.destroy_all
Mission.destroy_all
HeroPower.destroy_all
Power.destroy_all
Hero.destroy_all
User.destroy_all

val = User.new(email: 'val@val.com', password: 'valval', first_name: 'Valentine', last_name: 'Bodart')
henry = User.new(email: 'henry@henry.com', password: 'henryhenry', first_name: 'Henry', last_name: 'BlackBurn')
ben = User.new(email: 'ben@ben.com', password: 'henryhenry', first_name: 'Benjamin', last_name: 'Saint Viteux')
val.save!
henry.save!
ben.save!
# 10.times do
#   user = User.new(email: Faker::Internet.email, password: Faker::Code.npi, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
#   user.save!
# end
20.times do
  power = Power.new(power: Faker::Superhero.power)
  power.save
end

comments = ['Excellent work done, my hero was on time and smiling',
            'Looking forward to book a new mission!',
            "Can't wait to see my kids faces when I'll tell about them the mission we've done!",
            'A bit dissapointed to see my hero going at the end of the day so fast',
            'Poor service, my hero never showed up',
            'Excellent experience, I recommend using Hero you go!',
            'Good work, good mission, good hero. Thanks',
            'We want more',
            'A bit expensive at first glance but totally worth it',
            'Never again']

urls = ['https://www.livreshebdo.fr/sites/default/files/assets/images/maxresdefault_0.jpg',
        'http://pm1.narvii.com/7150/c57d5dcade11705f00393669f28550da59c78c73r1-681-382v2_uhq.jpg',
        'https://images.laprovence.com/media/hermes/2017-04/2017-04-01/20170401_21_1_0_0_0_obj14314361_1.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Hulk_%282540708438%29.jpg/2560px-Hulk_%282540708438%29.jpg',
        'https://www.netcost-security.fr/wp-content/uploads/2022/02/1645018926_Le-costume-Batman-de-Michael-Keaton-en-detail-dans-les-758x426.jpg',
        'https://static.wikia.nocookie.net/the-scar-chronicles/images/d/d3/Elastigirl.jpg',
        'https://www.lesinrocks.com/wp-content/uploads/2017/02/yoshi750.jpg',
        'https://techieslab.be/assets/images/portraits/niko-f55da65d.png',
        'http://ekladata.com/tnJnBzwFRJXtzgYfbow3rw9Symk.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/2/29/Cat_Sphynx._Kittens._img_11.jpg',
        'https://www.pointdevue.fr//storage/images/biography_900/official_portaits_of_king_philippe_and_queen_mathilde_of_belgium_0.jpg',
        'https://www.sortiraparis.com/images/1001/77153/488158-un-showcase-de-peppa-pig-a-la-grande-recre-beaugrenelle.jpg']

urls.each do |url|
  file = URI.open(url)

  hero = Hero.new(name: Faker::Superhero.name, location: Faker::Address.city, price: rand(100..1000), user: User.all.sample)

  rand(2..6).times do
    hero.powers << Power.all.sample
  end


  review = Review.new(rating: rand(2..5), comment: comments.sample)
  review.hero = hero
  user_id_to_avoid = hero.user.id
  review.user = User.all.reject { |user| user.id == user_id_to_avoid }.sample

  review.save
  # hero.review = Review.new(rating: rand(1..5), comment: ["excellent", "average", "poor"].sample)

  hero.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  hero.save!
  # p hero.reviews
end
