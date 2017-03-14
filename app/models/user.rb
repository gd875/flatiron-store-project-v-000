class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders

    def current_cart=(cart)
        if cart
            self.cart_id = cart.id
        else
            self.cart_id = nil
        end
    end

    def current_cart
        Cart.find_by(:id => self.cart_id)
    end

end
