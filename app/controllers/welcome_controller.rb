class WelcomeController < ApplicationController
  def index
    @sample_items = Item.all.sample(3)
  end
end
