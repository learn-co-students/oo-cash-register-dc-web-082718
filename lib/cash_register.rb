class CashRegister

  def initialize(discount=0)
    @total = 0
    @discount = discount.to_f
    @items = []
    @transactions = []
  end

  attr_accessor :total
  attr_reader :discount, :items

  def add_item(name, price, quantity=1)
    @total += price * quantity
    count = 0
    while count < quantity do
      @items << name
      new_hash = Hash.new
      new_hash =
      @transactions << price * quantity
      count += 1
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    puts "Total: #{@total}"
    puts "Discount: #{@discount}"
    puts "Discount%: #{@discount / 100}"
    @total -= (@total * (@discount / 100)).to_i
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @total -= @transactions.last
  end

end
