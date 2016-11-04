require 'warmup'

describe Warmup do

  let(:warmup) { Warmup.new }

  describe "#gets_shout" do

    before do
      allow(warmup).to receive(:gets)
    end

    after { warmup.gets_shout }

    it "should accept user input" do
      expect(warmup).to receive(:gets).exactly(:once).and_return("some text")
    end

    it "should return SCREAMING TEXT" do
      allow(warmup).to receive(:gets).and_return("some text")
      expect(warmup.gets_shout).to eq("SOME TEXT")
    end

    it "should puts SCREAMED input to the screen" do
      allow(warmup).to receive(:gets).and_return("some text")
      expect(warmup).to receive(:puts).with("SOME TEXT").and_return(nil)
    end

  end

  describe "#triple_size" do

    let(:arr) { double(size: 3) }

    it "should return thrice the size value of an array" do
      expect(warmup.triple_size(arr)).to eq(9)
    end

  end

  describe "#calls_some_methods" do

    let(:str) { instance_double("String", upcase!: "WHATEVER", reverse!: "REVETAHW", empty?: false) }

    let(:empty_str) { double(empty?: true) }

    it "raises an error if you pass it an empty string" do
      expect { warmup.calls_some_methods(empty_str) }.to raise_error("Hey, give me a string!")
    end

    it "destructively modifies your string to be all caps" do
      expect(str).to receive(:upcase!)
      warmup.calls_some_methods(str)
    end

    it "destructively modifies your string to be backwards" do
      string = "hello"
      expect(string).to receive(:reverse!)
      warmup.calls_some_methods(string)
    end

  end

end