# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#create movies
Movie.create(title: 'test', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
Movie.create(title: 'test 1', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
Movie.create(title: 'test 2', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
Movie.create(title: 'test 3', plot: 'aaa aaa aaa aaa aa aaa aaa aa')

#create season and episodes
season = Season.create(title: 'test', plot: 'aaa aaa aaa aaa aa aaa aaa aa', number: 'AUX 123')
episode = season.episodes.create(title: 'test e 1', plot: 'aaa aaa aaa aa a aaa')
child_episode = episode.child_episodes.create(title: 'test e 1', plot: 'aaa aaa aaa aa a aaa', season_id: season.id)
episode2 = season.episodes.create(title: 'test e 2', plot: 'aaa aaa aaa aa a aaa 2')

#create purchase options
po1 = PurchaseOption.create( price: 2.99, video_quality: 'HD')
po2 = PurchaseOption.create( price: 2.99, video_quality: 'HDD')

#create user and purchases
user = User.create(email: 'test@domain.com')
user.purchases.create(purchaseable: season, purchase_option: po1, expire_at: Time.now+2.day)
