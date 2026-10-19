class Num
  def enumes(num)
    if num % 3 != 0
      puts "Dzielenie z resztą"
    else
      puts "Dzielenie bez reszty"
    end
  end


  def mark(num)
    if num >= 80
      p ("Gites")
    elsif num >= 60
      if num % 2 == 0
        p "Zajebioza"
      else
        p "Nicosc"
      end
    else
      p "None of them"
    end
  end


end

num = Num.new

num.enumes(10)
num.enumes(15)
num.enumes(8)

num.mark(30)