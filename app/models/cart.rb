class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def total_price
    byebug
    if @contents.count > 1
      items = Item.find(contents.keys)
      items.sum(:price)
    else
      (Item.find(contents.keys).first.price * contents.keys.first.to_d)
    end
  end


end
