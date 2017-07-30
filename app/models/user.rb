class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :orders

  def most_ordered_item
    orders = Order.where(user: self).pluck(:id)
    order_items = ItemOrder.where(order: orders).pluck(:item_id)
    items = Item.where(id: order_items).group(:title).count
    item = Item.find(items.values.max)
  end
end
