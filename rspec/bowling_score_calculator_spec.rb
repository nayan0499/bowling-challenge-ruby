require 'rspec'
require 'bowling_score_calculator'
require 'bowling_frame'
require 'scorecard'

RSpec.describe "#initialize " do 
    it "get correct initialized parameters when getters are called" do
        
        scorecard = double
        frame = double 
        allow(scorecard).to receive(:frames).and_return(frame)
        score_calculator = BowlingScoreCalculator.new(scorecard)

        expect(score_calculator.frames).to eq(frame)
    end 
end

RSpec.describe "#initialize " do 
    it "get correct initialized parameters when getters are called" do
        scorecard = Scorecard.new([1,2,1,2])
        scorecard.generate_frames
        score_calculator = BowlingScoreCalculator.new(scorecard)
        total_score = score_calculator.get_total_score
        expect(total_score).to eq(6)
    end 
end

RSpec.describe "#get_total_score " do 
    it "get correct total score when there are only 3 frames " do
        scorecard = Scorecard.new([10,2,1,2,1])
        scorecard.generate_frames
        score_calculator = BowlingScoreCalculator.new(scorecard)
        total_score = score_calculator.get_total_score
        expect(total_score).to eq(19)
    end 
end

RSpec.describe "#get_total_score " do 
    it "get correct score when there are 10 frames and 2 strikes " do
        scorecard = Scorecard.new([1,9,2,7,6,4,7,2,3,6,3,3,10,10,6,3,5,3])
        scorecard.generate_frames
        
        score_calculator = BowlingScoreCalculator.new(scorecard)
        total_score = score_calculator.get_total_score
        puts scorecard.frames 
        expect(total_score).to eq(124)
    end 
end


RSpec.describe "#get_total_score " do 
    it "get the maximum score of 300 when all strike" do
        scorecard = Scorecard.new([10,10,10,10,10,10,10,10,10,10,10,10])
        scorecard.generate_frames
        score_calculator = BowlingScoreCalculator.new(scorecard)
        total_score = score_calculator.get_total_score
        expect(total_score).to eq(300)
    end 
end