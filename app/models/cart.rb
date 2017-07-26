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



end
