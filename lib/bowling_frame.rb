
class BowlingFrame
attr_reader   :first_roll_pins_knocked_down, :second_roll_pins_knocked_down, :total_pins_knocked_down, :next_frame
    def initialize(first_roll_pins_knocked_down, second_roll_pins_knocked_down=0, next_frame = nil) 
      raise ArgumentError,"Invalid number of pins knocked down" if second_roll_pins_knocked_down == 0 && first_roll_pins_knocked_down != 10
        @first_roll_pins_knocked_down = first_roll_pins_knocked_down
        @second_roll_pins_knocked_down = second_roll_pins_knocked_down
        @total_pins_knocked_down = first_roll_pins_knocked_down + second_roll_pins_knocked_down
        @next_frame = next_frame
        
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

    def get_bonus_score
      if get_bonus_roll_count == 1
        return next_frame.first_roll_pins_knocked_down
      elsif get_bonus_roll_count == 2
        return next_frame.total_pins_knocked_down
      end
      0
    end
    def get_total_score
      get_bonus_score + total_pins_knocked_down
    end

   

    def ==(other)
      return false unless other.is_a?(BowlingFrame)
       @first_roll_pins_knocked_down = other.first_roll_pins_knocked_down && @second_roll_pins_knocked_down == other.second_roll_pins_knocked_down

    end 



end
