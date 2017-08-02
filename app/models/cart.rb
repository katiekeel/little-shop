class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def total_price
    # contents.map do |key, value|
    #   Item.find(key).price * value
    # end.sum

    
  end

  def item_subtotal(item)
    item.price * self.contents[item.id.to_s]
  end

  def delete_item(id)
    contents.delete_if {|key, value| key == id.to_s}
  end

  def update_item(id, quantity)
    contents[id.to_s] = quantity.to_i
  end

  def empty_cart
    contents.clear
  end
end
