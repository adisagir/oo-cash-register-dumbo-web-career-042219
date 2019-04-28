class CashRegister

attr_accessor :total, :discount, :items_added, :last_item

def initialize(discount = 0)
  @total = 0
  @discount = discount
  @items_added = []
end

def total
  @total
end

def add_item(title, price, quantity = 1)
  self.total += price * quantity
  quantity.times do
    items_added << title
  end
  self.last_item = price * quantity
end

def apply_discount
  if discount != 0
    self.total = (total * (100.0 - @discount)) / 100.0
    "After the discount, the total comes to $#{self.total.to_i}."
  else
    "There is no discount to apply."
  end
end

def items
  @items_added
end

def void_last_transaction
  self.total = self.total - self.last_item
end

end
