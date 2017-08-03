class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :full_name
  validates_presence_of :address

  has_many :orders, dependent: :destroy

  def most_ordered_item
    # orders = Order.where(user: self).pluck(:id)
    # order_items = ItemOrder.where(order: orders).pluck(:item_id)
    # items = Item.where(id: order_items).group(:title).count
    # item_name = items.key(items.values.max)
    # item = Item.find_by(title: item_name)

    join_table = Order.joins(:item_orders).where(user_id: self.id)
    result = {}
    join_table.pluck(:item_id).uniq.each do |id|
      result[id] = join_table.where("item_id = ?", id).sum(:quantity)
    end
    Item.find((result.max_by {|k,v| v})[0])
  end
end
