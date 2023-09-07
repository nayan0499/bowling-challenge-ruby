class Frame 
    def initialize(scores)
        @scores = scores
        @total_score = 0
    end 
    def scores
        @scores 
    end
    def strike?
        @scores.length == 1 && @scores.first == 10
    end
    def spare?
        @scores.sum == 10 and @scores.length == 2
    end

    def get_scores_sum
        @scores.sum
    end 

    # TODO: Put this method in the most suitable place --> Where should I put this method? 
    def get_score_for_frame(index,frames)
        frame =frames[index]
        bonus_score = 0 
        if frame.strike?
          if index == 8
            bonus_score =frames[index+1].scores[0] + frames[index+1].scores[1]
          else 
            bonus_score =frames[index+1].strike? ? frames[index+1].get_scores_sum + frames[index+2].scores[0]  : frames[index+1].get_scores_sum 
          end 
        elsif frame.spare? 
          bonus_score = frames[index+1].scores[0]
        else
          bonus_score = 0 
        end 
        total = frame.get_scores_sum + bonus_score
        return total 
    end 

    


    def to_s
        "Frame: #{@scores}, total_score_score: #{@total_score} "
      end
    def number_of_bonus_rolls
        if strike? 
            return 2
        elsif spare? 
            return 1 
        0 
        end 
    end 

    def set_total_score_score(score)
        @total_score = score 
    end 
end 