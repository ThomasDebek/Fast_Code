class Order
  def initialize
    @orders = [
      { price: 100, paid: true },
      { price: 200, paid: false },
      { price: 300, paid: true }
    ]
  end

  def total_paid
    total = 0

    @orders.each do |order|
      if order[:paid]
        total += order[:price]
      end
    end

    total
  end
end

order = Order.new
p order.total_paid


module Loggable
  def log
    p "Logging......."
  end
end

class User
  include Loggable
end

class Person
  extend Loggable
end

user = User.new
user.log
people = Person.new.extend(Loggable)
people.log