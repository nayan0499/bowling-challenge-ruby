class Frame 
    def initialize(scores)
        @scores = scores
        @total = 0
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

    def get_total_score
        @scores.sum
    end 
    def to_s
        "Frame: #{@scores}, total_score: #{@total} "
      end
    def number_of_bonus_rolls
        if strike? 
            return 2
        elsif spare? 
            return 1 
        0 
        end 
    end 

    def set_total_score(score)
        @total = score 
    end 
end 