require 'pry'

class CashRegister

  attr_accessor :total, :discount, :prev_total
  attr_reader :items


  def initialize(emp_discount = 0)
    @total = 0
    @discount = emp_discount
    @items = []
    @prev_total = @total
  end
  #total = 100
  def add_item(title, price, op_quantity = 1)
    op_quantity.times {@items << title}
    @prev_total = price * op_quantity
    self.total += @prev_total # Does += work here? I believe it failed when tested in irb yesterday.
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    self.total = total * ((100.0 - discount.to_f)/100).to_i
    return "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @total -= @prev_total
  end
end
