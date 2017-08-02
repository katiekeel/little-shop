require 'rails_helper'

RSpec.describe Item, type: :model do
  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:categories) }
    it { should validate_numericality_of(:price)}
    it { should_not allow_value([0, -1, "A", "1"]).for(:price) }
  end

  context "Relationships" do
    it { should have_many(:category_items) }
    it { should have_many(:categories) }
    it { should have_many(:item_orders) }
    it { should have_many(:orders) }
  end
end
