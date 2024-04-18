class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :specifications, presence: true
  validates :image_url, presence: true, allow_blank: true

  serialize :specifications, JSON

end
