
require 'rspec'
require 'bowling_frame'

RSpec.describe "#initialize method" do 
    it "get correct initialized parameters when getters are called" do 
        frame = BowlingFrame.new(3,5)
        expect(frame.first_roll_pins_knocked_down).to be(3)
        expect(frame.second_roll_pins_knocked_down).to be(5)
        expect(frame.total_pins_knocked_down).to be(8)
    end 
end

RSpec.describe "#initialize method" do 
    it "set second_roll_pins_knocked_down to 0 by default when no argument is passed" do 
        frame = BowlingFrame.new(10)
        expect(frame.first_roll_pins_knocked_down).to be(10)
        expect(frame.second_roll_pins_knocked_down).to be(0)
        expect(frame.total_pins_knocked_down).to be(10)
    end 
end

RSpec.describe "#initialize method" do 
    it "raises an error when the first_roll_pins_knocked_down is not 10 and the second argument is not provided" do 
     
        expect { BowlingFrame.new(6)
        }.to raise_error(ArgumentError, "Invalid number of pins knocked down")
         
    end 
end