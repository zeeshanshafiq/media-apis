class Episode < ApplicationRecord
  default_scope { order(id: :desc) }
  belongs_to :season
  belongs_to :parent, class_name: Episode.name, optional: true
  has_many :child_episodes, class_name: Episode.name, foreign_key: :parent_id

end
