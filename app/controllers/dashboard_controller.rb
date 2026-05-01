class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.where(is_verified: true).or(Item.where(user: current_user))
    @item = Item.new
  end
end
