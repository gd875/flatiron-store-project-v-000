class CategoriesController < ApplicationController
    before_action :set_user, only: [:index, :show]


  def index
    @categories = Category.all
    @items = Item.all
  end

  def show
    # LineItem.find_by
    @category = Category.find_by(category_params(:id))
    # @category = Category.create(category_params(:id))
    # binding.pry
  end

  private

  def set_user
    @user = current_user
  end

  def category_params(*args)
    params.permit(*args)
  end

end
