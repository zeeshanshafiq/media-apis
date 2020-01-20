class User < ApplicationRecord
  has_many :purchases, -> { where( "expire_at > ?", Time.now ) }

  def purchase_media(media_id:, media_type:, purchase_option_id:)
    purchae_option = PurchaseOption.find(purchase_option_id)
    klass = media_type.camelize.constantize
    purchaseable = klass.find(media_id)
    purchases.create(purchaseable: purchaseable, purchase_option: purchae_option, expire_at: Time.now+2.day)
  end
end
