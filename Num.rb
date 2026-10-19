class Num
  def enumes(num)
    if num % 3 != 0
      puts "Dzielenie z resztą"
    else
      puts "Dzielenie bez reszty"
    end
  end
end

num = Num.new

num.enumes(10) 
num.enumes(15)
num.enumes(8)