require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:full_name)}
    it { should validate_presence_of(:address)}

  end

  context "relationships" do
    it {should have_many(:orders) }
  end
end
