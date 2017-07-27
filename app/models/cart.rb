class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def total_price
    contents.map do |key, value|
      Item.where(id: key).sum(:price) * value
    end.sum
  end

  def delete_item(id)
    contents.delete_if {|key, value| key == id.to_s}
  end

  def update_item(id, quantity)
    contents[id.to_s] = quantity.to_i
  end
end
