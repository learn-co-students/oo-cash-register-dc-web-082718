require 'pry'

class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  attr_accessor :discount, :total

  def add_item(food, price, *quantity)
    if quantity != []
      @total += (price * quantity[0])
      quantity[0].times do
        @items << food
      end
    else
      @total += price
      @items << food
    end

  end

  def apply_discount
    if discount != 0
      @total = @total - (total * discount / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = 0 
  end

end
