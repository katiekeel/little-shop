require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  context "relationships" do
    it {should belong_to(:order) }
    it {should belong_to(:item) }
  end
end
