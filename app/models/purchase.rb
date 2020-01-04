class Purchase < ApplicationRecord
  default_scope { order(expire_at: :desc) }
  belongs_to :purchase_option
  belongs_to :purchaseable, polymorphic: true
  belongs_to :user
  validate :purchaseable_in_library, on: :create

  before_create do
    self.expire_at = Purchase.expiry_time
  end

  def purchaseable_in_library
    errors.add(:user_id, " already have this #{purchaseable_type}.") if user.purchases.where(purchaseable: purchaseable).present?
  end

  def self.expiry_time
    Time.now + 2.day
  end

end
