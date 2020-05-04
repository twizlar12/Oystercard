require 'Oystercard.rb'

describe Oystercard do
  it "Freshly initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq(0)
  end

  it "Top up requires an argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

end




