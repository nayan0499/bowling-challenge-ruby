
class BowlingScoreCalculator
attr_accessor :frames
    def initialize(scorecard)
        @frames = scorecard.frames  
    end 

    def get_total_score
        total = 0
        for frame in @frames
            total+= frame.get_total_score
        end 
        return total 
    end 
end 

