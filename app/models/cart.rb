class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items

    def total
        cost = 0
        self.line_items.each do |line_item|
            cost += (line_item.quantity * line_item.item.price)
        end
        cost
    end

    def line_items
        LineItem.where(:cart_id => self.id)
    end

    def items
        found_line_items = LineItem.where(:cart_id => self.id)
        found_line_items.collect do |line_item|
            Item.find_by(:id => line_item.item_id)
        end
    end

    def add_item(item)
        if find_item = LineItem.find_by(:id => item) #Update quantity if exists
            find_item.quantity += 1
            find_item.cart_id = self.id
            find_item
        else #Create new line item if not found
            LineItem.new(:item_id => item, :cart_id => self.id, :quantity => 1)
        end
    end

end
