
class BowlingFrame
  attr_reader :first_roll_pins_knocked_down, :second_roll_pins_knocked_down, :total_pins_knocked_down
    def initialize(first_roll_pins_knocked_down, second_roll_pins_knocked_down=0) 
      raise ArgumentError,"Invalid number of pins knocked down" if second_roll_pins_knocked_down == 0 && first_roll_pins_knocked_down != 10
        @first_roll_pins_knocked_down = first_roll_pins_knocked_down
        @second_roll_pins_knocked_down = second_roll_pins_knocked_down
        @total_pins_knocked_down = first_roll_pins_knocked_down + second_roll_pins_knocked_down
        
    end 
  end 