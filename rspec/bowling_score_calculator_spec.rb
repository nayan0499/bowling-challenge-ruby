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