class LineItemsController < ApplicationController
    before_action :set_user, only: [:create]


  def create
      if found_line_item = LineItem.find_by(item_params(:item_id))
        found_line_item.quantity += 1
        found_line_item.save
      else
        @line_item = LineItem.create(item_params(:item_id))
      end

      unless found_line_item
          if !@user.current_cart
            @user.current_cart = Cart.create(user:  @user)
          end

            @line_item.update(cart_id: @user.current_cart.id)
            @user.current_cart .line_items << @line_item
            @user.current_cart.save
            @user.save
      end

        redirect_to cart_path(@user.current_cart)
  end

  private

  def set_user
    @user = current_user
  end

  def item_params(*args)
      params.permit(*args)
  end

end
