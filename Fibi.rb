class Fibi
  def show
    puts "Ile liczb ciągu Fibonacciego chcesz wyświetlić?"
    number = gets.chomp.to_i

    a, b = 0, 1

    number.times do
      print "#{a} "
      a, b = b, a + b
    end

    puts
  end
end

fibi = Fibi.new
fibi.show