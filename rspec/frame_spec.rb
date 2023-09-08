
require 'rspec'
require 'bowling_frame'

RSpec.describe "#initialize " do 
    it "get correct initialized parameters when getters are called" do 
        frame = BowlingFrame.new(3,5)
        expect(frame.first_roll_pins_knocked_down).to be(3)
        expect(frame.second_roll_pins_knocked_down).to be(5)
        expect(frame.total_pins_knocked_down).to be(8)
    end 
end

RSpec.describe "#initialize " do 
    it "set second_roll_pins_knocked_down to 0 by default when no argument is passed" do 
        frame = BowlingFrame.new(10)
        expect(frame.first_roll_pins_knocked_down).to be(10)
        expect(frame.second_roll_pins_knocked_down).to be(0)
        expect(frame.total_pins_knocked_down).to be(10)
    end 
end

RSpec.describe "#initialize" do 
    it "returns the next frame when called" do 
        next_frame = BowlingFrame.new(5,6)
        frame = BowlingFrame.new(10,second_roll_pins_knocked_down=0)
        frame.set_next_frame(next_frame)
        next_frame = frame.next_frame
        expect(next_frame).to eq(BowlingFrame.new(5,6))
        
         
    end 
end


RSpec.describe "#get_bonus_roll_count " do 
    it "get 0 when it is neither a strike nor a spare" do 
     
        frame = BowlingFrame.new(2,3)
        bonus_roll_count = frame.get_bonus_roll_count 
        expect(bonus_roll_count).to eq(0)
        
         
    end 
end

RSpec.describe "#get_bonus_roll_count " do 
    it "get 1 when it is a spare" do 
     
        frame = BowlingFrame.new(2,8)
        bonus_roll_count = frame.get_bonus_roll_count 
        expect(bonus_roll_count).to eq(1)
        
         
    end 
end

RSpec.describe "#get_bonus_roll_count" do 
    it "returns 2 when it is a strike" do 
     
        frame = BowlingFrame.new(10)
        bonus_roll_count = frame.get_bonus_roll_count 
        expect(bonus_roll_count).to eq(2)
        
         
    end 
end

RSpec.describe "#get_bonus_score" do 
    it "returns 0 when it is neither a strike nor a spare" do 
     
        frame = BowlingFrame.new(2,3)
        bonus_score= frame.get_bonus_score
        expect(bonus_score).to eq(0)
        
         
    end 
end


RSpec.describe "#==" do 
    it "returns true when all the instance variables are the same" do 
        frame1 = BowlingFrame.new(10)
        frame2 = BowlingFrame.new(10)
        expect(frame1).to eq(frame2)
        
         
    end 
end

RSpec.describe "#get_bonus_score" do 
    it "returns next frame's first roll knocked down pins when it is a spare" do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(8,second_roll_pins_knocked_down=2)
        current_frame.set_next_frame(next_frame)
        bonus_score= current_frame.get_bonus_score
        expect(bonus_score).to eq(5)
         
    end 
end

RSpec.describe "#get_bonus_score" do 
    it "returns next frame's total pins knocked down pins when it is a strike" do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(10, second_roll_pins_knocked_down= 0)
        current_frame.set_next_frame(next_frame)
        bonus_score= current_frame.get_bonus_score
        expect(bonus_score).to eq(11)
         
    end 
end

RSpec.describe "#get_bonus_score" do 
    it "returns 10 + next next frame's first roll pins knocked down when the current frame and the next frame are strikes " do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(10, second_roll_pins_knocked_down= 0)
        current_frame.set_next_frame(next_frame)
        bonus_score= current_frame.get_bonus_score
        expect(bonus_score).to eq(11)
         
    end 
end

RSpec.describe "#get_bonus_score" do 
    it "returns 10 + next next frame's first roll pins knocked down when the current frame and the next frame are strikes " do 
        next_frame = BowlingFrame.new(10, second_roll_pins_knocked_down= 0)
        current_frame = BowlingFrame.new(10, second_roll_pins_knocked_down= 0)
        current_frame.set_next_frame(next_frame)
        next_frame.set_next_frame(BowlingFrame.new(10))
        bonus_score= current_frame.get_bonus_score
        expect(bonus_score).to eq(20)
         
    end 
end

RSpec.describe "#get_total_score" do 
    it "returns the sum of total pins knocked down and bonus when strike " do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(10, second_roll_pins_knocked_down= 0)
        current_frame.set_next_frame(next_frame)
        bonus_score= current_frame.get_total_score
        expect(bonus_score).to eq(21)
         
    end 
end

RSpec.describe "#get_total_score" do 
    it "returns the sum of total pins knocked down and bonus when spare" do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(2, second_roll_pins_knocked_down= 8)
        current_frame.set_next_frame(next_frame)
        bonus_score= current_frame.get_total_score
        expect(bonus_score).to eq(15)
         
    end 
end

RSpec.describe "#get_total_score" do 
    it "returns the sum of total pins knocked down and bonus when neither spare nor strike" do 
        next_frame = BowlingFrame.new(5,6)
        current_frame = BowlingFrame.new(2, second_roll_pins_knocked_down= 5)
        current_frame.set_next_frame(next_frame)

        bonus_score= current_frame.get_total_score
        expect(bonus_score).to eq(7)
         
    end 
end

RSpec.describe "#strike?" do 
    it "returns true if first roll pins == 10 " do 
        
        current_frame = BowlingFrame.new(10)
        expect(current_frame.strike?).to eq(true)
         
    end 
end