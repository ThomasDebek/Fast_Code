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


  def add_stock(amount)
    if amount > 0
      @stock += amount
      p "Added #{amount} burgers to stock. New stock: #{@stock}."
      p "Current stock: #{@stock}"
    else
      p "Amount out of stock "
    end
  end

  def score
    if @price <= 50
      "Good"
    elsif @price <= 100
      "Average"
    else
      "Not Good"
    end
  end

  def good_price?
    @price <= 50
  end

  def sell
    if available?
      if good_price?
        @stock -= 1
        puts "#{name} sold for #{price} PLN. Remaining stock: #{@stock}."
        @price
      else
        puts "#{name} is too expensive. Price: #{price} PLN."
        0
      end
    else
      puts "#{name} is out of stock."
      0
    end
  end

  def info_burger
    if available?
      puts "#{name} is available."
      puts "Price: #{price} PLN."
      puts "Stock: #{stock}."
      puts "Score: #{score}."   # <--- TUTAJ WYKORZYSTUJESZ METODĘ score
    else
      puts "#{name} is out of stock."
    end
  end
end

classic_burger = Burger.new("Classic Burger", 40, 200)

classic_burger.add_stock(50)

classic_burger.sell
classic_burger.info_burger
