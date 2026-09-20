class Burger
  attr_accessor :name, :price, :stock

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def available?
    @stock > 0
  end

  def sell
    if available?
      @stock -= 1
      puts "#{name} sold for #{price} PLN. Remaining stock: #{@stock}."
      @price
    else
      puts "#{name} is out of stock."
      0
    end
  end

  def info_burger
    if available?
      puts "#{name} is available. Price: #{price} PLN. Stock: #{stock}."
    else
      puts "#{name} is out of stock."
    end
  end

end

classic_burger = Burger.new("Classic Burger", 100, 200)


classic_burger.sell
classic_burger.info_burger