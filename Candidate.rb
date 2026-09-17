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


class RecruitmentProcess
  MINIMUM_AVERAGE = 70
  MINIMUM_SINGLE_SCORE = 50

  def initialize(company_name, candidate)
    @company_name = company_name
    @candidate = candidate
  end

  def passed?
    return false if @candidate.scores.empty?

    good_average = @candidate.average_score >= MINIMUM_AVERAGE

    no_failed_test = @candidate.scores.values.all? do |score|
      score >= MINIMUM_SINGLE_SCORE
    end

    good_average && no_failed_test
  end

  def print_report
    puts "=== #{@company_name} Recruitment ==="
    puts
    puts "Candidate: #{@candidate.name}"
    puts "Level: #{@candidate.level}"
    puts
    puts "Knowledge tests:"

    @candidate.scores.each do |skill, score|
      puts "#{skill}: #{score}/100"
    end

    puts
    puts "Total points: #{@candidate.total_score}"
    puts "Average: #{@candidate.average_score.round(2)}%"

    strongest = @candidate.strongest_skill
    weakest = @candidate.weakest_skill

    puts "Strongest skill: #{strongest[0]} (#{strongest[1]}/100)"
    puts "Weakest skill: #{weakest[0]} (#{weakest[1]}/100)"

    puts
    puts "=== FINAL RESULT ==="

    if passed?
      puts "PASSED"
      puts "Candidate advances to the technical interview."
    else
      puts "FAILED"
      puts "Candidate does not advance to the next stage."
    end
  end
end


candidate = Candidate.new("Thomas", "Junior Ruby Developer", {})

candidate.add_score("Ruby", 82)
candidate.add_score("OOP", 74)
candidate.add_score("SQL", 61)
candidate.add_score("Debugging", 90)

recruitment = RecruitmentProcess.new("CodeForge", candidate)

recruitment.print_report