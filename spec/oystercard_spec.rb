require "oystercard"

describe Oystercard do

  context "#initialize" do

    it "initializes with a balance of 0" do
      expect(subject.balance).to eq(0)
    end

  end

  context "#top_up" do
      it "adds the amount to balance" do
        subject.top_up(10)
        expect(subject.balance).to eq(10)
      end

  end

end
