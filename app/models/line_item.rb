class LineItem < ActiveRecord::Base
    belongs_to :cart
    belongs_to :item
    after_initialize :default_quantity

    def default_quantity
        self.quantity ||= 1
        # self.save
    end
end
