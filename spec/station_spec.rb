require 'station.rb'

describe Station do

  let(:subject) { described_class.new("Bank", 1) }

  it "Station will have a name" do
    expect(subject.name).to eq("Bank")
  end

  it "Station will have a zone" do
    expect(subject.zone).to eq(1)
  end
end

