require 'leap_year'

describe LeapYear do
  describe "leap_year tests based on acceptance criteria" do
    it "first criteria - 2000" do
      expect(subject.leap_year?(2000)).to eq(true)
    end

    it "second criteria - 1970" do
      expect(subject.leap_year?(1970)).to eq(false)
    end

    it "third criteria - 1900" do
      expect(subject.leap_year?(1900)).to eq(false)
    end

    it "fourth criteria - 1988" do
      expect(subject.leap_year?(1988)).to eq(true)
    end

    it "fifth criteria - 1500" do
      expect(subject.leap_year?(1500)).to eq(false)
    end
  end

  describe "leap_range tests" do
    it "- check the method exists and accepts two arguments" do
      expect(subject).to respond_to(:leap_range).with(2).arguments
    end
# single line test?
    it {is_expected.to respond_to(:leap_range).with(2).arguments}

    it "- checking 1500 - 1520 inclusive" do
      expect(subject.leap_range(1500, 1520)).to eq [1504, 1508, 1512, 1516, 1520]
    end

    # testing mocking of the leap_year check functionality to reduce complexity
    it "checking stubbed 'leap_year' functionality" do
      allow(subject).to receive(:leap_year?).and_call_original
      allow(subject).to receive(:leap_year?).with(1500).and_return(true)
      expect(subject.leap_range(1500, 1520)).to eq [1500, 1504, 1508, 1512, 1516, 1520]
    end

  end
end
