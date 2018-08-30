require 'pry'
class CashRegister

  attr_accessor :employee_discount, :total, :items, :latest, :void_last_transaction
  attr_reader

  def initialize(employee_discount=0)
    @total = 0
    @employee_discount = employee_discount
    @items = []
  end

  def discount
    @employee_discount = employee_discount
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    #adds items to items array
    quantity.times do
      @items << title
    end
    @latest = price * quantity

  end

  def apply_discount
    if @employee_discount != 0
      self.total *= ((100 - discount.to_f)/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @latest
  end

end
