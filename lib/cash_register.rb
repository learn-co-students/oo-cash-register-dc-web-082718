class CashRegister
  attr_accessor :total, :discount, :array

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @array = []
  end

  def add_item(item_name, price, quantity = 1)
    i = 0
    until i == quantity
      i += 1
      @array << item_name
    end

    @price = price
    @item_name = item_name
    @quantity = quantity
    self.total += price * quantity
  end

  def apply_discount
    if @discount != 0
      self.total *= (1 - (@discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @array
  end

  def void_last_transaction
    self.total -= @price 
  end

end
