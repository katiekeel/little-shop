class ItemOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates_presence_of :quantity

  def subtotal
    quantity * item.price
  end
end
