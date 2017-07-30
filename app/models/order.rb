class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def total_price
    ItemOrder.joins(:item).where("order_id = ?", self.id).sum("price * quantity")
  end

end
