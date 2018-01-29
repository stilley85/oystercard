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

      it "raises an error if top up puts us over the max balance" do
        maximum_balance = Oystercard::MAX_BALANCE
        subject.top_up(maximum_balance)
        expect { subject.top_up(1) }.to raise_error "Too much! The limit is #{maximum_balance}"
      end

  end

  context "#deduct" do

    it "deducts the amount from the balance" do
      subject.deduct(10)
      expect(subject.balance).to eq(-10)
    end

    it "deducts the amount from the balance" do
      subject.top_up(20)
      subject.deduct(10)
      expect(subject.balance).to eq(10)
    end


  end

end
