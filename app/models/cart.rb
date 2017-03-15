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

    def add_item(item_id)
        if found_item = LineItem.find_by(:id => item_id) #Update quantity if exists
            found_item.quantity += 1
            found_item.cart_id = self.id
            found_item
        else #Create new line item if not found
            # binding.pry
            LineItem.new(:item_id => item_id, :cart_id => self.id, :quantity => 1)
        end
    end

end
