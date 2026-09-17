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

  def average_score
    return 0 if @scores.empty?
    total_score.to_f / @scores.size
  end

  def strongest_skill
    @scores.max_by { |skill, score| score }
  end

  def weakest_skill
    @scores.min_by { |skill, score| score }
  end

end


candidate = Candidate.new("Thomas", "Ruby Developer", {} )
candidate.add_score("Ruby", 82)
candidate.add_score("OOP", 74)
candidate.add_score("SQL", 61)
candidate.add_score("Debugging", 90)
puts candidate.total_score


strongest_skill, strongest_score = candidate.strongest_skill
weakest_skill, weakest_score = candidate.weakest_skill

puts "Candidate: #{candidate.name}"
puts "Level: #{candidate.level}"
puts "Scores: #{candidate.scores}"
puts "Total score: #{candidate.total_score}"
puts "Average score: #{candidate.average_score}"
puts "Strongest skill: #{strongest_skill} – #{strongest_score} points"
puts "Weakest skill: #{weakest_skill} – #{weakest_score} points"