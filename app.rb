
require_relative 'lib/scorecard'
require_relative 'lib/bowling_frame'
require_relative 'lib/bowling_score_calculator'


class BowlingGame
    def run
      print "Please enter your score: "
      scores = gets.chomp
      input_array = scores.split(",")
      list_of_scores = input_array.map { |element| element.to_i }
      scorecard = Scorecard.new(list_of_scores)
      scorecard.generate_frames()
      score_calculator = BowlingScoreCalculator.new(scorecard)
      score = score_calculator.get_total_score
      p "Your total score is: #{score}"
    end
  end
  
  # Instantiate the BowlingGame class and run the game
  game = BowlingGame.new
  game.run if __FILE__ == $0
  
