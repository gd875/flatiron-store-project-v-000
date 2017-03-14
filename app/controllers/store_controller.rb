class StoreController < ApplicationController
    before_action :set_user, only: [:index]


  def index
    @categories = Category.all
    @items = Item.all
  end

  private

  def set_user
    @user = current_user
  end

end
