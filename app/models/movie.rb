class Movie < ApplicationRecord
  default_scope { order(created_at: :desc) }
  has_many :purchases, as: :purchaseable
end
