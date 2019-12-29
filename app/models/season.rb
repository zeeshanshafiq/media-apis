class Season < ApplicationRecord
  default_scope { order(created_at: :desc) }
  has_many :episodes, -> { where parent_id: nil }
  has_many :purchases, as: :purchaseable
end
