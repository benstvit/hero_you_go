require 'faker'
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

30.times do
  price = rand(100..1000)
  hero = Hero.new(name: Faker::Superhero.name, location: Faker::Address.city, price: price, user: User.all.sample)
  hero.save!
end

20.times do
  power = Power.new(power:Faker::Superhero.power)
  power.save!
end
