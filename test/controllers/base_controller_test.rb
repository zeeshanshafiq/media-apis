class BaseControllerTest < ActionDispatch::IntegrationTest

  setup do
    Movie.destroy_all
    Episode.destroy_all
    Season.destroy_all
    Purchase.destroy_all
    PurchaseOption.destroy_all
    User.destroy_all

    @movie1 = Movie.create(title: 'test', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
    @movie1 = Movie.create(title: 'test 1', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
    @movie1 = Movie.create(title: 'test 2', plot: 'aaa aaa aaa aaa aa aaa aaa aa')
    @movie1 = Movie.create(title: 'test 3', plot: 'aaa aaa aaa aaa aa aaa aaa aa')

    #create season and episodes
    @season = Season.create(title: 'test', plot: 'aaa aaa aaa aaa aa aaa aaa aa', number: 'AUX 123')
    @episode = @season.episodes.create(title: 'test e 1', plot: 'aaa aaa aaa aa a aaa')
    @child_episode = @episode.child_episodes.create(title: 'test e 1', plot: 'aaa aaa aaa aa a aaa', season: @season)
    @episode2 = @season.episodes.create(title: 'test e 2', plot: 'aaa aaa aaa aa a aaa 2')
    @season = Season.create(title: 'test2', plot: 'aaa aaa aaa aaa aa aaa aaa aa', number: 'AUX 124')

    #create purchase options
    @po1 = PurchaseOption.create( price: 2.99, video_quality: 'HD')
    @po2 = PurchaseOption.create( price: 2.99, video_quality: 'HDD')

    #create user and purchases
    @user = User.create(email: 'test@domain.com')
    # @user.purchases.create(purchaseable: @season, purchase_option: @po1)
  end

end