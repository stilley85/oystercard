require "oystercard"

describe Oystercard do

  context "#initialize" do

    it "initializes with a balance of 0" do
      expect(subject.balance).to eq(0)
    end

  end

  context "#top_up" do

      it { is_expected.to respond_to(:top_up) }

  end

end
