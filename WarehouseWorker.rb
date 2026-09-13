class WarehouseWorker
  attr_accessor :name, :position, :salary, :bonus

  def initialize(name, position, salary)
    @name = name
    @position = position
    @salary = salary
    @bonus = 0
  end

  def add_bonus(amount)
    @bonus += amount
    "#{@name} received a bonus of #{amount} PLN."
  end

  def total_salary
    @salary + @bonus
  end

  def worker_info
    "Name: #{@name}\n" +
      "Position: #{@position}\n" +
      "Base salary: #{@salary} PLN\n" +
      "Bonus: #{@bonus} PLN\n" +
      "Total salary: #{total_salary} PLN"
  end
end


adam = WarehouseWorker.new("Adam", "Forklift Operator", 6200)
michal = WarehouseWorker.new("Michal", "Loader", 5700)
kamil = WarehouseWorker.new("Kamil", "Shift Leader", 7500)


puts adam.add_bonus(500)
puts adam.add_bonus(250)

puts michal.add_bonus(400)

puts kamil.add_bonus(1000)


puts "\n--- WORKERS ---"

puts "\n#{adam.worker_info}"
puts "\n#{michal.worker_info}"
puts "\n#{kamil.worker_info}"