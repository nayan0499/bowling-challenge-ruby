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

    # TODO: Where should this be? 
    def get_score_for_frame(index,frames)
        frame =frames[index]
        if frame.strike?
          if index == 8
            bonus_score =frames[index+1].scores[0] + frames[index+1].scores[1]
            total_score = frame.get_scores_sum + bonus_score
            return  total_score 
          else 
            bonus_score =frames[index+1].strike? ? frames[index+1].get_scores_sum + frames[index+2].scores[0]  : frames[index+1].get_scores_sum 
            total_score = frame.get_scores_sum + bonus_score
            return  total_score 
          end 
        elsif frame.spare? 
          total_score = frame.get_scores_sum + frames[index+1].scores[0]
          return  total_score
        else
          total_score = frame.get_scores_sum
          return  total_score
        end 
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