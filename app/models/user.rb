class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :full_name
  validates_presence_of :address

  has_many :orders, dependent: :destroy

  def most_ordered_item
    join_table = Order.joins(:item_orders).where(user_id: self.id)
    result = {}
    join_table.pluck(:item_id).uniq.each do |id|
      result[id] = join_table.where("item_id = ?", id).sum(:quantity)
    end
    max_ordered_item_id = (result.max_by {|k,v| v})[0] 
    Item.find(max_ordered_item_id)
  end
end
