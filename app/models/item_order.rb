class ItemOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def subtotal
    quantity * item.price
  end
end
