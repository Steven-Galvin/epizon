class Product < ApplicationRecord
  has_many :order_items

  validates :name, :description, :price, presence: true
  validates :description, length: { maximum: 300 }
end
