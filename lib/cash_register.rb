class CashRegister
  attr_accessor :total

 def initialize(discount = nil)
   @total = 0
   @discount = discount
   @items = []
   @item_prices = []
 end

 def add_item(title, price, quantity = nil)
   price *= quantity if quantity
   @total += price
   @items << title
   @item_prices << price
 end

 def apply_discount
   if @discount
     @total -= @total * (@discount / 100)
     "After the discount, the total comes to $#{@total}."
   else
     "There is no discount to apply."
   end
 end

 def items
   @items
 end

 def void_last_transaction
   if @item_prices.empty?
     0.0
   else
     @total -= @item_prices[@item_prices-1]
     @item_prices.pop
 end

end
