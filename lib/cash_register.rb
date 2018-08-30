require 'pry'
class CashRegister

attr_accessor :total, :discount, :title, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @cart = []
    end

  def add_item(title, price, quantity=1)
    item = {}
    item[:title] = title
    item[:price] = price
    item[:quantity] = quantity
    @cart << item
    full_cost = price * quantity
    @total += full_cost
    @last_transaction_total = @total

  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      discount_total = @total * (@discount.to_i * 0.0100)
      @total -= discount_total
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    items_list = []
    @cart.each do |x|
      x[:quantity].times do
        items_list << x[:title]
      end
    end
    items_list
  end

  def void_last_transaction
    @total -= @last_transaction_total
 end

end
