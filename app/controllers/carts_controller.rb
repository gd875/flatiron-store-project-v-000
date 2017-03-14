class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :checkout]
    before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :checkout]

    def index
        @carts = Cart.all
    end

    def show
        # binding.pry
    end

    def new
        @cart = Cart.new
    end

    def edit

    end

    def create
      @cart = Cart.find_or_create_by(cart_params(:id))
      redirect_to cart_path(@cart)
    end

    def update
     @cart.update(cart_params(:id))
      redirect_to cart_path(@cart)
    end

    def checkout
        @cart.line_items.each do |line_item|
            line_item.item.inventory -= line_item.quantity
            line_item.item.save
        end

        # cart = Cart.find_by(:id => params[:id])
        # binding.pry
        @user.current_cart = nil
        @user.save
        redirect_to cart_path(@cart)
    end

    private

    def set_user
        @user = current_user
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params(*args)
      params.require(:cart).permit(*args)
    end
end
