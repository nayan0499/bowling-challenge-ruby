require 'score_calculator'

RSpec.describe ScoreCalculator do
  describe "#rolls_to_include_in_frame" do
    it "returns the correct number of rolls based on frames and score" do
      # Create a list of mock Frame instances with a 'scores' property
      
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9, 0, 2, 7, 5, 3, 1, 2]
      # Create an instance of your class that contains the method you want to test
      score_calculator = ScoreCalculator.new(scores)
      result = score_calculator.rolls_to_include_in_frame(3,6)


      # Test the method
      expect(result).to eq(2) # Example for a strike
        end
  end
end

RSpec.describe ScoreCalculator do
  describe "#rolls_to_include_in_frame" do
    it "returns the correct number of rolls based on frames and score" do
      # Create a list of mock Frame instances with a 'scores' property
      
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9, 0, 2, 7, 5, 3, 1, 2]
      # Create an instance of your class that contains the method you want to test
      score_calculator = ScoreCalculator.new(scores)
      result = score_calculator.rolls_to_include_in_frame(9,18)


      # Test the method
      expect(result).to eq(2) # Example for a strike
        end
  end
end

RSpec.describe ScoreCalculator do
  describe "#rolls_to_include_in_frame" do
    it "returns the correct number of rolls based on frames and score" do
      # Create a list of mock Frame instances with a 'scores' property
      
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 10, 2, 7, 5, 3, 10,10,10]
      # Create an instance of your class that contains the method you want to test
      score_calculator = ScoreCalculator.new(scores)
      result = score_calculator.rolls_to_include_in_frame(9,17)


      # Test the method
      expect(result).to eq(3) # Example for a strike
        end
  end
end

RSpec.describe ScoreCalculator do
  describe "#rolls_to_include_in_frame" do
    it "returns the correct number of rolls based on frames and score" do
      # Create a list of mock Frame instances with a 'scores' property
      
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9, 0, 2, 7, 5, 3, 10, 2,8]
      # Create an instance of your class that contains the method you want to test
      score_calculator = ScoreCalculator.new(scores)
      result = score_calculator.rolls_to_include_in_frame(9,18)


      # Test the method
      expect(result).to eq(3) # Example for a strike
        end
  end
end




RSpec.describe ScoreCalculator do
  describe "#rolls_to_include_in_frame" do
    it "generate the number of rolls" do
      # Arrange
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9, 0, 2, 7, 5, 3, 1, 2]
      score_calculator = ScoreCalculator.new(scores)

      # Act
      frames = score_calculator.create_frames

      # Assert
      expect(frames.length).to eq(10) # Expecting 10 frames
      expect(frames[0].scores).to eq([1, 2])
      expect(frames[1].scores).to eq([4, 5])
      expect(frames[9].scores).to eq([1, 2]) # Last frame should have the remaining scores
    end
  end
end


# # Assuming you have the ScoreCalculator and Frame classes defined

RSpec.describe ScoreCalculator do
  describe "#create_frames" do
    it "creates frames correctly based on the scores" do
      # Arrange
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9, 0, 2, 7, 5, 3, 1, 2]
      score_calculator = ScoreCalculator.new(scores)

      # Act
      frames = score_calculator.create_frames

      # Assert
      expect(frames.length).to eq(10) # Expecting 10 frames
      expect(frames[0].scores).to eq([1, 2])
      expect(frames[1].scores).to eq([4, 5])
      expect(frames[9].scores).to eq([1, 2]) # Last frame should have the remaining scores
    end
  end
end



RSpec.describe ScoreCalculator do
  describe "#create_frames" do
    it "creates frames correctly based on the scores with one strike" do
      # Arrange
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 10, 2, 7, 5, 3, 1, 2]
      score_calculator = ScoreCalculator.new(scores)

      # Act
      frames = score_calculator.create_frames

      # Assert
      expect(frames.length).to eq(10) # Expecting 10 frames
      expect(frames[0].scores).to eq([1, 2])
      expect(frames[1].scores).to eq([4, 5])
      expect(frames[6].scores).to eq([10])
      expect(frames[9].scores).to eq([1, 2]) # Last frame should have the remaining scores
    end
  end
end


RSpec.describe ScoreCalculator do
  describe "#create_frames" do
    it "creates frames correctly based on the scores with two strikes" do
      # Arrange
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9,1, 2, 7, 10, 2,3]
      score_calculator = ScoreCalculator.new(scores)

      # Act
      frames = score_calculator.create_frames

      # Assert
      expect(frames.length).to eq(10) # Expecting 10 frames
      expect(frames[0].scores).to eq([1, 2])
      expect(frames[1].scores).to eq([4, 5])
      expect(frames[9].scores).to eq([2,3]) # Last frame should have the remaining scores
    end
  end
end


RSpec.describe ScoreCalculator do
  describe "#create_frames" do
    it "creates frames correctly based on the scores with two strikes and 3 rolls in the 10th frame" do
      # Arrange
      scores = [1, 2, 4, 5, 3, 6, 7, 2, 8, 1, 8, 2, 9,1, 2, 7, 10, 10,2,3]
      score_calculator = ScoreCalculator.new(scores)

      # Act
      frames = score_calculator.create_frames

      # Assert
      expect(frames.length).to eq(10) # Expecting 10 frames
      expect(frames[0].scores).to eq([1, 2])
      expect(frames[1].scores).to eq([4, 5])
      expect(frames[9].scores).to eq([10,2,3]) # Last frame should have the remaining scores
    end
  end
end


RSpec.describe "calculate total of 1 frame" do 
  it "calculate total of one frame" do 
    score_calculator = ScoreCalculator.new([1,2])
    score_calculator.create_frames
    p score_calculator.frames
    total_score =  score_calculator.get_total_score
    expect(total_score).to eq(3)
  end
end 


RSpec.describe "calculate total of 1 frame" do 
  it "calculate total of one frame" do 
    score_calculator = ScoreCalculator.new([8,2,1,6])
    score_calculator.create_frames
    p score_calculator.frames
    total_score =  score_calculator.get_total_score
    expect(total_score).to eq(18)
  end
end 

RSpec.describe "calculate total of 1 frame" do 
  it "calculate total of one frame" do 
    score_calculator = ScoreCalculator.new([10,1,6])
    score_calculator.create_frames
    total_score =  score_calculator.get_score_for_frame(0, Frame.new([10]))
    expect(total_score).to eq(17)
  end
end 


RSpec.describe "calculate total of 1 frame" do 
  it "calculate total of one frame" do 
    score_calculator = ScoreCalculator.new([10,10,6,7])
    score_calculator.create_frames
    total_score =  score_calculator.get_score_for_frame(0,Frame.new([10]))
    expect(total_score).to eq(26)
  end
end 



RSpec.describe "calculate total" do 
  it "calculate total of all frames" do 
    score_calculator = ScoreCalculator.new([10,10,6,7])
    score_calculator.create_frames
    total_score =  score_calculator.get_total_score
    expect(total_score).to eq(62)
  end
end 

RSpec.describe "calculate total" do 
  it "calculate total of all frames" do 
    score_calculator = ScoreCalculator.new( [7, 3, 9, 0, 10, 10, 8, 1, 4, 5, 5, 3, 7, 2, 10, 10, 9, 1])
    score_calculator.create_frames
    
    total_score =  score_calculator.get_total_score
    puts score_calculator.frames
    expect(total_score).to eq(159)
  end
end 

