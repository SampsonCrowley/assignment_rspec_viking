require 'weapons/bow'

describe Bow do

  let(:bow) { Bow.new }

  describe "#initialize" do

    let(:empty_bow) { Bow.new(0) }

    it "should access to read number of arrows" do
      expect(bow).to respond_to(:arrows)
    end

    it "should default with 10 arrows if no argument given" do
      expect(bow.arrows).to eq(10)
    end

    it "should start with specified amount of arrows" do
      expect(Bow.new(100).arrows).to eq(100)
    end

    it "should reduce arrows by 1 when used" do
      bow.use
      expect(bow.arrows).to eq(9)
    end

    it "should throw an error if used with no arrows" do
      expect {empty_bow.use}.to raise_error("Out of arrows")
    end

  end

end