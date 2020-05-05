require 'Oystercard.rb'

describe Oystercard do
  let(:station) { double :station }

  it "Freshly initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq(0)
  end

  it "Top up requires an argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "Balance of card will increase by the amount topped up" do
    expect(subject.top_up(5)).to eq("Oystercard topped up by £5")
  end

  it "Balance of card should not exceed £90" do
    subject.top_up(Oystercard::MAX_BALANCE)
    expect { subject.top_up(5) }.to raise_error("Top up failed, maximum balance cannot exceed £90")
  end

  it "Balance of card will decrease by the amount deducted" do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.touch_out).to eq("Oystercard deducted by £1")
  end 

  it "Initially not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "After touch in customer will be in a journey " do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "After touch out customer will not be in a journey " do
    subject.top_up(5)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "To touch in, balance must be greater than or equal to £1" do
    expect { subject.touch_in(station) }.to raise_error("Insufficient funds, balance is: £0, please top up")
  end

  it "When journey complete reduce the balance by minimum fare" do
    subject.top_up(5)
    subject.touch_in(station)
    expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
  end


  it "When touch in, record station" do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

end
