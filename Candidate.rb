class Candidate
  attr_accessor :name, :level, :scores


  def initialize(name, level, scores)
    @name = name
    @level = level
    @scores = scores
  end

  def add_score(skill, score)
    if score.between?(0, 100)
      @scores[skill] = score
    else
      puts "Score must be between 0 and 100."
    end
  end

  def total_score
    @scores.values.sum
  end
end


candidate = Candidate.new("Adam", "Junior Ruby Developer", {} )
candidate.add_score("Ruby", 82)
candidate.add_score("OOP", 74)
candidate.add_score("SQL", 61)
candidate.add_score("Debugging", 90)
puts candidate.total_score