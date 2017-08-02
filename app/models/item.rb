class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :image_path
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :item_orders
  has_many :orders, through: :item_orders

  enum status: ["active", "retired"]
end
