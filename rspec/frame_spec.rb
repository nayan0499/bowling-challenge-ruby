
require 'rspec'
require 'frame'

RSpec.describe "strike? method" do 
    it "return true if strike" do 
        frame = Frame.new([1,2])
        result = frame.strike? 
        expect(result).to be(false)
    end 
end

RSpec.describe "strike? method" do 
    it "return false if not strike" do 
        frame = Frame.new([8,2])
        result = frame.strike? 
        expect(result).to be(false)
    end 
end

RSpec.describe "strike? method" do 
    it "return false if not strike" do 
        frame = Frame.new([10])
        result = frame.strike? 
        expect(result).to be(true)
    end 
end


RSpec.describe "spare? method" do 
    it "return false if not spare" do 
        frame = Frame.new([10])
        result = frame.spare? 
        expect(result).to be(false)
    end 
end

RSpec.describe "spare? method" do 
    it "return true if spare" do 
        frame = Frame.new([2,8])
        result = frame.spare? 
        expect(result).to be(true)
    end 
end

RSpec.describe "spare? method" do 
    it "return false if not spare" do 
        frame = Frame.new([2,4])
        result = frame.spare? 
        expect(result).to be(false)
    end 
end
