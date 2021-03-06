require "oystercard"

describe Oystercard do

  context "funds not required" do

    context "#initialize" do

      it "initializes with a balance of 0" do
        expect(subject.balance).to eq(0)
      end

      it "initializes as not in journey" do
        expect(subject.in_journey).to eq(false)
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

    context "#touch_in" do

      it "Doesn't allow touch in if insufficient funds" do
        expect{ subject.touch_in }.to raise_error "insufficient funds"
      end

    end

  end

  context "funds required" do

    before(:each) do
      subject.top_up(20)
    end

    context "#touch_in" do

      it "sets in journey status to true" do
        subject.touch_in
        expect(subject.in_journey).to eq true
      end

    end

    context "#touch_out" do

      it "sets in journey status to false" do
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey).to eq false
      end

    end

  end

end
