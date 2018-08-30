require "pry-byebug"
class CashRegister

    attr_accessor :discount, :total, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @costs = {}
    end

    def add_item(item,price,quantity=1)
        self.total += (price * quantity)
        @costs[item] = [price,quantity]
        qt = quantity
        while qt > 0
            self.items << item
            qt -= 1
        end

    end

    def void_last_transaction
        # binding.pry
        item = self.items.pop()
        self.total -= (@costs[item][0] * @costs[item][1])
        @costs.delete(item)

    end

    def apply_discount
        if self.discount > 0
            self.total = self.total * ((100.0 - self.discount) / 100.0)
            return "After the discount, the total comes to $#{self.total.round(0)}."
        else
            return "There is no discount to apply."
        end
    end
end
