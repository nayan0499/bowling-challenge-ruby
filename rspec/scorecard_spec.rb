require 'scorecard'
require 'rspec'
require 'bowling_frame'

RSpec.describe "#initialize " do 
    it "get correct initialized parameters when getters are called" do 
        scorecard_generator = Scorecard.new([1,2])
        expect(scorecard_generator.scores).to eq([1,2])
    end 
end

RSpec.describe "#get_scores " do 
    it "get correct first, second, and third pins" do 
        scorecard_generator = Scorecard.new([10,10,10,10,10,10,10,10,10,10,10,10])
        scores = scorecard_generator.get_scores(9,3)
        expect(scores.length).to eq(3)
        expect(scores).to eq([10,10,10])
    end 
end

RSpec.describe "#get_scores " do 
    it "get correct first, second, and third pins" do 
        scorecard_generator = Scorecard.new([0,0,0,0,0,0,0,0,0,0])
        scores = scorecard_generator.get_scores(0,1)
        expect(scores.length).to eq(3)
        expect(scores).to eq([0,0,0])
    end 
end



RSpec.describe "#create_frame " do 
    it "creates a frame given the number of rolls" do 
        scorecard_generator = Scorecard.new([1,2])
        frame = double
        allow(frame).to receive(:first_roll_pins_knocked_down).and_return(1)
        allow(frame).to receive(:second_roll_pins_knocked_down).and_return(2)
        frame = scorecard_generator.create_frame(0,2)
        expect(frame.first_roll_pins_knocked_down).to eq(1)
        expect(frame.second_roll_pins_knocked_down).to eq(2)
    end 
end

RSpec.describe "#create_frame " do 
    it "creates a frame given the number of rolls" do 
        scorecard_generator = Scorecard.new([1,2,3,4])
        frame = double
        allow(frame).to receive(:first_roll_pins_knocked_down).and_return(3)
        allow(frame).to receive(:second_roll_pins_knocked_down).and_return(4)
        frame = scorecard_generator.create_frame(2,2)
        expect(frame.first_roll_pins_knocked_down).to eq(3)
        expect(frame.second_roll_pins_knocked_down).to eq(4)
    end 
end

RSpec.describe "#create_frame " do 
    it "creates a frame given the number of rolls when strikes" do 
        scorecard_generator = Scorecard.new([10,10,10,10,10,10,10,10,10,10,10,10])
        frame = scorecard_generator.create_frame(9,3)
        p frame
        expect(frame.first_roll_pins_knocked_down).to eq(10)
        expect(frame.second_roll_pins_knocked_down).to eq(10)
        expect(frame.third_roll_pins_knocked_down).to eq(10)
    end 
end

RSpec.describe "#get_roll_count " do 
    it "returns 2 when not a strike" do 
        scorecard_generator = Scorecard.new([1,2,3,4])
        roll_count = scorecard_generator.get_roll_count(0)
        expect(roll_count).to eq(2)
    end 
end

RSpec.describe "#get_roll_count " do 
    it "returns 1 when strike" do 
        scorecard_generator = Scorecard.new([10,2,3,4])
        roll_count = scorecard_generator.get_roll_count(0)
        expect(roll_count).to eq(1)
    end 
end

RSpec.describe "#get_roll_count " do 
    it "returns 3 when it is the last frame and 3 rolls are left" do 
        scorecard_generator = Scorecard.new([1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,10,2,4])
        allow(scorecard_generator).to receive_message_chain(:frames, :length).and_return(9)
        roll_count = scorecard_generator.get_roll_count(18)
        expect(roll_count).to eq(3)
    end 
end

RSpec.describe "#generate_frames" do 
    it "create 10 frames" do 
        scorecard_generator = Scorecard.new([1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,10,2,4])
        scorecard_generator.generate_frames
        frames = scorecard_generator.frames
        expect(frames.length).to eq(10)
    end 
end

RSpec.describe "#generate_frames" do 
    it "create 10 frames with next_frames populated" do 
        scorecard_generator = Scorecard.new([1,2,3,2,10,10,1,2,1,2,1,2,1,2,1,2,10,2,4])
        scorecard_generator.generate_frames
        frames = scorecard_generator.frames
        expect(frames.length).to eq(10)
        expect(frames[0].next_frame).to eq(BowlingFrame.new(3,2))
        expect(frames[9].next_frame).to eq(nil)
        expect(frames[8].next_frame).to eq(BowlingFrame.new(10,2,4))
        expect(frames[1].next_frame).to eq(BowlingFrame.new(10, second_roll_pins_knocked_down=0))
        expect(frames[2].next_frame).to eq(BowlingFrame.new(10, second_roll_pins_knocked_down=0))
    end 
end


RSpec.describe "#generate_frames" do 
    it "create 10 frames with next_frames populated" do 
        scorecard_generator = Scorecard.new([10,10,10,10,10,10,10,10,10,10,10,10])
        scorecard_generator.generate_frames
        frames = scorecard_generator.frames
        expect(frames.length).to eq(10)
        expect(frames[9]).to eq(BowlingFrame.new(10, second_roll_pins_knocked_down = 10, third_roll_pins_knocked_down = 10 ))

    end 
end

RSpec.describe "#create_frame" do 
    it "create a frame with 0 pins knocked" do 
        scorecard_generator = Scorecard.new([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        frame = scorecard_generator.create_frame(0,2)
        expect(frame).to eq(BowlingFrame.new(0, second_roll_pins_knocked_down=0, third_roll_pins_knocked_down=0))

    end 
end


RSpec.describe "#generate_frames" do 
    it "create 10 frames with 0 scores" do 
        scorecard_generator = Scorecard.new([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        scorecard_generator.generate_frames
        frames = scorecard_generator.frames
        expect(frames.length).to eq(10)
        expect(frames[9]).to eq(BowlingFrame.new(0, second_roll_pins_knocked_down = 0, third_roll_pins_knocked_down = 0 ))

    end 
end
