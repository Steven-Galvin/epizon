class Product < ApplicationRecord
  has_many :order_items

  has_attached_file :image, default_url: "/images/placeholder.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :description, :price, presence: true
  validates :description, length: { maximum: 300 }
end
