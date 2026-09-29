class Burger
  attr_accessor :name, :price, :stock, :size, :extras

  def initialize(name, price, stock, size )
    @name = name
    @price = price
    @stock = stock
    @size = size
    @extras = []
  end

  def available?
    @stock > 0
  end

  def size_price
    if @size == "small"
      p  "Your #{name} is #{@price} PLN."
    elsif @size == "medium"
      p "Your #{name} is #{@price + 10} PLN."
    elsif @size == "large"
      p "Your #{name} is #{@price + 20} PLN."
    else
      p "Your #{name} is #{@price} PLN."
    end
  end


  def add_extras(name, price)
    @extras << [name, price]
  end

  def total_price
    @price + @extras.map(&:last).sum
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

  def remove_extras(name)
    extra = @extras.find { |extra| extra[0] == name }

    if extra
      @extras.delete(extra)
      p "Removed extra: #{name}"
    else
      p "No extra: #{name}"
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

  def customer_rating(rating)
    if rating >= 4
      puts "#{name} has very good customer reviews."
    elsif rating >= 3
      puts "#{name} has average customer reviews."
    else
      puts "#{name} has poor customer reviews."
    end
  end

  def show_extras
    @extras.each do |extra|
      puts "- #{extra[0]}: #{extra[1]} PLN"
    end
  end

  def expensive_extras
    @extras.each do
      |extra|
      if extra[1] > 5
        puts "----------"*5
        puts "- #{extra[0]}: #{extra[1]} PLN"
      end
    end
  end


  def cheapest_extras
    if @extras.empty?
      p "NO extras found!"
    else
      extra = @extras.min_by { |extra| extra[1] }

      p "--extras--extras--"*3
      p "#{extra[0]}: #{extra[1]} PLN"
    end
  end

  def find_extra(name)
    extra = @extras.find { |extra| extra[0] == name }
    if extra
      puts "Found extra: #{extra[0]} - #{extra[1]} PLN"
    else
      puts "No extra found with name: #{name}"
    end
  end


  def change_price(new_price)
    if new_price > 0
      @price = new_price
      puts "#{new_price} changed."
    else
      puts "#{new_price} is not a valid price."
    end
  end

  def info_burger
    if available?
      puts "#{name} is available."
      puts "Price: #{price} PLN."
      puts "Stock: #{stock}."
      puts "Score: #{score}."
      puts "Size: #{size_price}."
      puts "Extras: #{extras}"
      puts "Total: #{total_price}"
    else
      puts "#{name} is out of stock."
    end
  end
end

classic_burger = Burger.new("Classic Burger", 40, 200, "large")

classic_burger.add_stock(50)

classic_burger.sell
classic_burger.info_burger
classic_burger.customer_rating(3)
classic_burger.size_price

classic_burger.add_extras("Cheese", 4)
classic_burger.add_extras("Bacon", 8)
classic_burger.add_extras("Cheese", 5)
classic_burger.add_extras("Onion", 3)

classic_burger.info_burger
classic_burger.add_extras("Cheese", 6)
classic_burger.remove_extras("Cheese")
classic_burger.remove_extras("Cheese")
classic_burger.info_burger


classic_burger.show_extras
classic_burger.expensive_extras
classic_burger.find_extra("Bacon")
classic_burger.change_price(45)
classic_burger.info_burger
classic_burger.cheapest_extras
class Burger
  attr_accessor :name, :price, :stock, :size, :extras

  def initialize(name, price, stock, size )
    @name = name
    @price = price
    @stock = stock
    @size = size
    @extras = []
  end

  def available?
    @stock > 0
  end

  def size_price
    if @size == "small"
      p  "Your #{name} is #{@price} PLN."
    elsif @size == "medium"
      p "Your #{name} is #{@price + 10} PLN."
    elsif @size == "large"
      p "Your #{name} is #{@price + 20} PLN."
    else
      p "Your #{name} is #{@price} PLN."
    end
  end


  def add_extras(name, price)
    @extras << [name, price]
  end

  def total_price
    @price + @extras.map(&:last).sum
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

  def remove_extras(name)
    extra = @extras.find { |extra| extra[0] == name }

    if extra
      @extras.delete(extra)
      p "Removed extra: #{name}"
    else
      p "No extra: #{name}"
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

  def customer_rating(rating)
    if rating >= 4
      puts "#{name} has very good customer reviews."
    elsif rating >= 3
      puts "#{name} has average customer reviews."
    else
      puts "#{name} has poor customer reviews."
    end
  end

  def show_extras
    @extras.each do |extra|
      puts "- #{extra[0]}: #{extra[1]} PLN"
    end
  end

  def expensive_extras
    @extras.each do
      |extra|
      if extra[1] > 5
        puts "----------"*5
        puts "- #{extra[0]}: #{extra[1]} PLN"
      end
    end
  end


  def cheapest_extras
    if @extras.empty?
      p "NO extras found!"
    else
      extra = @extras.min_by { |extra| extra[1] }

      p "--extras--extras--"*3
      p "#{extra[0]}: #{extra[1]} PLN"
    end
  end

  def find_extra(name)
    extra = @extras.find { |extra| extra[0] == name }
    if extra
      puts "Found extra: #{extra[0]} - #{extra[1]} PLN"
    else
      puts "No extra found with name: #{name}"
    end
  end


  def change_price(new_price)
    if new_price > 0
      @price = new_price
      puts "#{new_price} changed."
    else
      puts "#{new_price} is not a valid price."
    end
  end

  def average_extra_price
    if @extras.empty?
      p "No extras found!"
    else
      total_price = @extras.map(&:last).sum
      average = total_price.to_f / @extras.size
      p "Average extra price: #{average.round(2)} PLN"
    end
  end

  def info_burger
    if available?
      puts "#{name} is available."
      puts "Price: #{price} PLN."
      puts "Stock: #{stock}."
      puts "Score: #{score}."
      puts "Size: #{size_price}."
      puts "Extras: #{extras}"
      puts "Total: #{total_price}"
    else
      puts "#{name} is out of stock."
    end
  end
end

classic_burger = Burger.new("Classic Burger", 40, 200, "large")

classic_burger.add_stock(50)

classic_burger.sell
classic_burger.info_burger
classic_burger.customer_rating(3)
classic_burger.size_price

classic_burger.add_extras("Cheese", 4)
classic_burger.add_extras("Bacon", 8)
classic_burger.add_extras("Cheese", 5)
classic_burger.add_extras("Onion", 3)

classic_burger.info_burger
classic_burger.add_extras("Cheese", 6)
classic_burger.remove_extras("Cheese")
classic_burger.remove_extras("Cheese")
classic_burger.info_burger


classic_burger.show_extras
classic_burger.expensive_extras
classic_burger.find_extra("Bacon")
classic_burger.change_price(45)
classic_burger.info_burger
classic_burger.cheapest_extras
classic_burger.average_extra_price
