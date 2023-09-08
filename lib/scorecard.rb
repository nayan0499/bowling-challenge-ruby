require 'bowling_frame'

class Scorecard
attr_reader :scores, :frames 
    def initialize(scores)
        @scores = scores 
        @frames = []
    end 
    def generate_frames
        index = 0 
        prev_frame = nil 
        while index < scores.length 
            rolls = get_roll_count(index)
            frame = create_frame(index, rolls)
            if not prev_frame
                prev_frame = frame 
            elsif prev_frame
                prev_frame.set_next_frame(frame) 
                prev_frame = frame 
            end
            @frames << frame 
            index += rolls 
        end 
    end
    def get_scores(index, number_of_rolls)
        first_roll_pins, second_roll_pins, third_roll_pins= scores[index,number_of_rolls]
        if second_roll_pins == nil 
            second_roll_pins = 0
        end
        if third_roll_pins == nil 
            third_roll_pins = 0
        end
        return [first_roll_pins, second_roll_pins, third_roll_pins]
    end 

    def create_frame(index,number_of_rolls)
        first_roll_pins, second_roll_pins, third_roll_pins= get_scores(index,number_of_rolls)
        frame = BowlingFrame.new(first_roll_pins, second_roll_pins_knocked_down=second_roll_pins,third_roll_pins_knocked_down=third_roll_pins)
        return frame 
    end

    def get_roll_count(index)
        if frames.length == 9
            return rolls = scores.length - index 
           
        elsif scores[index] == 10
            return 1
        end
        2
    end
    
end 








