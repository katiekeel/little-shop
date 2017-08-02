class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :image_path, :categories
  validates_uniqueness_of :title
  validates :price, numericality: { :greater_than => 0 }
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :item_orders
  has_many :orders, through: :item_orders

  enum status: ["active", "retired"]
end
