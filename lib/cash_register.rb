require 'pry'
class CashRegister
  # creates setter and getter methods for total
  attr_accessor :total
  # Creates getter method for discount, and items
  attr_reader :discount, :items
  # initializes item array

  # initializes CashRegister object with optional employee_discount argument
  # default == 0
  def initialize(employee_discount = 0)
    # initialization
    @total = 0
    @discount = employee_discount
    # creates items array and last_transaction hash to keep track of items and
    # the last purchase made
    @items = []
    @last_transaction = {}
  end
# adds item purchase accepting item name, price and optional quantity arguments
  def add_item (title, price, quantity = 1)
    # adds purchase price to total
    @total += price * quantity
    # Adds proper quanity of item to cart
    count = 0
    while count < quantity
     @items << title
     count += 1
   end
   # keeps track of last_added item
   @last_transaction[:item] = title
   @last_transaction[:price] = price
   @last_transaction[:quantity] = quantity

  end
# applies discount to total
  def apply_discount
    # checks if there is any discount
    if discount == 0
      "There is no discount to apply."
    else
    #applies discount
    @total = @total * (1-@discount/100.0)
    # converts back to integer
    @total = @total.to_i
    "After the discount, the total comes to $#{@total}."
    end
  end


  def void_last_transaction
    # removes last item added to array
    @items.pop()
    # subtracts last purchases price from total
    @total -= @last_transaction[:price]
  end
end
