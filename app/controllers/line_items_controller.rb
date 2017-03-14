class LineItemsController < ApplicationController
    before_action :set_user, only: [:create]


  def create
     @line_item = LineItem.create(item_params(:item_id))
     if !@user.current_cart
        @user.current_cart = Cart.create(user:  @user)
     end
        @user.current_cart .line_items << @line_item
        @user.save
  end

  private

  def set_user
    @user = current_user
  end

  def item_params(*args)
      params.permit(*args)
  end

end
