
require 'frame'


class ScoreCalculator
    def initialize(scores)
        @scores = scores
        @frames = []
    end 

    #TODO: Where should this be? 
    def create_frames
        index = 0
      
        while index < @scores.length
          rolls_to_include = rolls_to_include_in_frame(frames.length, index)
      
          frame_scores = @scores[index, rolls_to_include]
          frame = Frame.new(frame_scores)
          @frames << frame
          index += rolls_to_include
        end
      end 
      
    def rolls_to_include_in_frame(frame_length, index)
        if frame_length == 9
            return @scores.length - index 
        elsif @scores[index] == 10 
            return 1
        end 
        return 2 
    end 


    def frames 
      @frames 
    end 
      

    def get_total_score
      index = 0
      total_score  = 0 
      while index < @frames.length
        current_frame = @frames[index]
        total_score += current_frame.get_score_for_frame(index, @frames)
        index +=1 
      end
      total_score 
    end 

  end 
      




