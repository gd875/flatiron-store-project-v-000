module ApplicationHelper
    def current_cart
        if @user
            @user.current_cart
        end
    end
end
