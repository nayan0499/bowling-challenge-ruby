require 'score_calculator'

RSpec.describe "get_score_by_frame" do 
    it "calculates score for one frame" do 
        score_calculator = ScoreCalculator.new 
        result = score_calculator.get_score_by_frame([8,1])
        expect(result).to eq(9)
    end 
end 