require "pry"

class CashRegister

  attr_accessor :discount, :total, :old_total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    i = 0
    while i < quantity
      @items << title
      i += 1
    end
    @old_total = self.total - price
  end

  def apply_discount
    if self.discount > 0
      self.total = self.total*(100-self.discount)/100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.old_total
  end

end
