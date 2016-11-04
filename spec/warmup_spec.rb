require_relative '../lib/warmup'

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

end