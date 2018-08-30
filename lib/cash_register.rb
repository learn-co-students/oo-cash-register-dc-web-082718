require 'pry'

class CashRegister

  attr_accessor :total #doesnt work with just reader??
  attr_reader :discount, :add_item, :items



  def initialize (empl_discount=nil, discount=20)
    @total = 0
    @discount = discount
    @empl_discount = empl_discount
  end

  def add_item (item_name, price, quantity=1)
    @transaction = [item_name, price, quantity]

    if !@items then @items = [] end
    for i in 1..quantity
      @items << item_name
    end

    @total += price * quantity
  end

  def apply_discount
    if @empl_discount == nil then return "There is no discount to apply." end

    @total *= 1-(@empl_discount/100.0)
    # binding.pry
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @transaction[1] * @transaction[2]
  end

end
