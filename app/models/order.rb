class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :item_orders, dependent: :destroy
  has_many :items, through: :item_orders

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def total_price
    ItemOrder.joins(:item).where("order_id = ?", self.id).sum("price * quantity")
  end

  def ordered
    self.where(status: "ordered")
  end

  def paid
    self.where(status: "paid")
  end

  def cancelled
    self.where(status: "cancelled")
  end

  def completed
    self.where(status: "completed")
  end

end
