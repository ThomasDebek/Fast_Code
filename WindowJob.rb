class WindowJob
  attr_accessor :building_name, :floors, :price

  def initialize(building_name, floors, price)
    @building_name = building_name
    @floors = floors
    @price = price
  end

  def job_info
    "Building: #{@building_name}\n" +
      "Floors: #{@floors}\n" +
      "Price: #{@price} PLN"
  end

  def high_building?
    @floors >= 10
  end
end


office = WindowJob.new("Sky Office", 14, 3200)
hotel = WindowJob.new("Central Hotel", 8, 1800)
tower = WindowJob.new("North Tower", 22, 5400)


class CleaningCrew
  def initialize(name)
    @name = name
    @jobs = []
  end

  def add_job(job)
    @jobs << job
    "Job for '#{job.building_name}' has been added."
  end

  def show_jobs
    if @jobs.empty?
      "No jobs available."
    else
      list = ""

      @jobs.each_with_index do |job, index|
        list += "#{index + 1}. #{job.building_name} - #{job.floors} floors - #{job.price} PLN\n"
      end

      list.strip
    end
  end

  def total_value
    total = 0

    @jobs.each do |job|
      total += job.price
    end

    total
  end

  def high_buildings
    @jobs.select do |job|
      job.high_building?
    end
  end
end


crew = CleaningCrew.new("High Clean")

puts crew.add_job(office)
puts crew.add_job(hotel)
puts crew.add_job(tower)

puts "\nAll jobs:"
puts crew.show_jobs

puts "\nTotal value:"
puts "#{crew.total_value} PLN"

puts "\nHigh buildings:"

crew.high_buildings.each do |job|
  puts "#{job.building_name} - #{job.floors} floors"
end