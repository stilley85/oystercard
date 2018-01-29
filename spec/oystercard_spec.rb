require "oystercard"

describe Oystercard do

  context "#initialize" do
    
    it "initializes with a balance of 0" do
      expect(subject.balance).to eq(0)
    end

  end

end
