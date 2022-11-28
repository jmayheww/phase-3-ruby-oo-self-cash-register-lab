require 'pry'
class CashRegister
  attr_reader :discount, :items
  attr_accessor :total, :last_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      items << title
    end

    self.last_price = price * quantity

    self.total += price * quantity
  end

  def apply_discount
    if discount > 0
      self.total = self.total - (discount.to_f / 100) * self.total
      "After the discount, the total comes to $#{self.total.to_i}."

    else
      'There is no discount to apply.'
    end
  end

  def void_last_transaction
    self.total = self.total - last_price
  end
end

c1 = CashRegister.new
