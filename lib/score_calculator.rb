
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
      
        @frames
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
        total_score += get_score_for_frame(index)
        index +=1 
      end
      total_score 
    end 

    # TODO: Where should this be? 
    def get_score_for_frame(index)
      frame = @frames[index]
      if frame.strike?
        if index == 8
          bonus_score = @frames[index+1].scores[0] +@frames[index+1].scores[1]
          total = frame.get_total_score + bonus_score
          frame.set_total_score(total)
          return  total 
        else 
          bonus_score = @frames[index+1].strike? ? @frames[index+1].get_total_score + @frames[index+2].scores[0]  : @frames[index+1].get_total_score 
          total = frame.get_total_score + bonus_score
          frame.set_total_score(total)
          return  total 
        end 
      elsif frame.spare? 
        total = frame.get_total_score + @frames[index+1].scores[0]
        frame.set_total_score(total)
        return  total
      else
        total = frame.get_total_score
        frame.set_total_score(total)
        return  total
      end 
    end 
  end 
      






    #     total = 0 
    #     bonus_rolls =  0
    #     for frame in @frames 
    #       if bonus_rolls == 1
    #         total+= frame.scores[0] + frame.get_total_score 
    #         bonus_rolls = 0
    #       elsif bonus_rolls == 2
    #         total+= frame.get_total_score * 2 
    #         bonus_rolls = 0
    #       else
    #         total += frame.get_total_score 
    #         bonus_rolls = 0
    #       bonus_rolls = frame.number_of_bonus_rolls
    #       end 
    #     end 
    #     total 
    #   end 
    # end 
      