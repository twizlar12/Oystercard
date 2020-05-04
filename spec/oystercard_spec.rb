require 'Oystercard.rb'

describe Oystercard do
  it "Freshly initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq(0)
  end
end

