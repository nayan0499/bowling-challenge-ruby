
class BowlingFrame
attr_reader   :first_roll_pins_knocked_down, :second_roll_pins_knocked_down, :total_pins_knocked_down, :next_frame, :total_score, :third_roll_pins_knocked_down
    def initialize(first_roll_pins_knocked_down, second_roll_pins_knocked_down=0, third_roll_pins_knocked_down=0) 
      raise ArgumentError,"Invalid number of pins knocked down" if second_roll_pins_knocked_down == 0 && first_roll_pins_knocked_down != 10
        @first_roll_pins_knocked_down = first_roll_pins_knocked_down
        @second_roll_pins_knocked_down = second_roll_pins_knocked_down
        @third_roll_pins_knocked_down = third_roll_pins_knocked_down
        @total_pins_knocked_down = first_roll_pins_knocked_down + second_roll_pins_knocked_down +third_roll_pins_knocked_down
        @next_frame = nil
        @total_score = 0
        
    end 
    def set_next_frame(frame)
      @next_frame = frame 
    end 

    def get_bonus_roll_count
      if @first_roll_pins_knocked_down == 10 
        return 2
      elsif @total_pins_knocked_down == 10
        return 1
      end 
      0
    end

    def get_bonus_roll_count
      if @first_roll_pins_knocked_down == 10 
        return 2
      elsif @total_pins_knocked_down == 10
        return 1
      end 
      0
    end

    def strike? 
      return @first_roll_pins_knocked_down == 10
    end

    def nineth_frame? 
      return next_frame.next_frame == nil
    end 

  

    def get_bonus_score

      if next_frame == nil

        return 0

      elsif get_bonus_roll_count == 1
        return next_frame.first_roll_pins_knocked_down

      elsif get_bonus_roll_count == 2
        if next_frame.strike?
          if next_frame.next_frame == nil
            return next_frame.first_roll_pins_knocked_down + next_frame.second_roll_pins_knocked_down
          else 
            return next_frame.first_roll_pins_knocked_down + next_frame.next_frame.first_roll_pins_knocked_down
          end 
        else 
          p "here"
          return next_frame.first_roll_pins_knocked_down + next_frame.second_roll_pins_knocked_down
      end
    end 
      0
    end
    def get_total_score
      total =get_bonus_score + total_pins_knocked_down
      @total_score = total 
      return total
    end

    def to_s
      "Frame: first_roll:#{@first_roll_pins_knocked_down}, second_roll:#{@second_roll_pins_knocked_down}, total_score: #{@total_score}"
    end 
   

    def ==(other)
      return false unless other.is_a?(BowlingFrame)
       @first_roll_pins_knocked_down = other.first_roll_pins_knocked_down && @second_roll_pins_knocked_down == other.second_roll_pins_knocked_down

    end 



end
