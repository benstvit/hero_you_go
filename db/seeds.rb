require "open-uri"
require 'faker'

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
  power = Power.new(power:Faker::Superhero.power)
  power.save
end


urls = ['https://cdn.pixabay.com/photo/2017/07/06/18/48/spider-girl-2478975__340.jpg',
  'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/87193/88279/Captain_America_Marvel_Avengers_Party_Face_Mask_buy_star_masks_at_starstills__58929.1412244951.jpg',
  'https://images.laprovence.com/media/hermes/2017-04/2017-04-01/20170401_21_1_0_0_0_obj14314361_1.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Hulk_%282540708438%29.jpg/2560px-Hulk_%282540708438%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/1b/Batman_%28black_background%29.jpg',
  'https://static.wikia.nocookie.net/the-scar-chronicles/images/d/d3/Elastigirl.jpg',
  'https://stock.wikimini.org/w/images/3/37/Yoshi.jpg',
  'https://techieslab.be/assets/images/portraits/niko-f55da65d.png',
  'http://ekladata.com/tnJnBzwFRJXtzgYfbow3rw9Symk.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/2/29/Cat_Sphynx._Kittens._img_11.jpg',
  'https://www.pointdevue.fr//storage/images/biography_900/official_portaits_of_king_philippe_and_queen_mathilde_of_belgium_0.jpg',
  'https://i.la-croix.com/1400x933/smart/2020/03/25/1201086051/Donald-Trump-manifeste-impatiencedune-conference-presse-Maison-Blanche-mardi-24_0.jpg']


urls.each do |url|

  file = URI.open(url)

  hero = Hero.new(name: Faker::Superhero.name, location: Faker::Address.city, price: rand(100..1000), user: User.all.sample)

  rand(2..6).times do
    hero.powers << Power.all.sample
  end

  # hero.review = Review.new(rating: rand(1..5), comment: ["excellent", "average", "poor"].sample)

  hero.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  hero.save!
end
