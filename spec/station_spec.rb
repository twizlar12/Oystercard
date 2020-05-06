require 'Station.rb'

describe Station do

    it "Station will have a zone" do
        subject = Station.new("Bank")
        expect(subject.name).to eq("Bank")
    end
end

