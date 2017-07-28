require 'rails_helper'

RSpec.describe Order, type: :model do
  context "relationships" do
    it {should belong_to(:user) }
  end
end
