require 'viking'

describe Viking do

  let(:dex) { Viking.new("Dex", 90, 420) }

  let(:sampson) { Viking.new("Sampson", 450, 11) }

  let(:dudebro) { Viking.new("Dude", 5) }

  let(:bow) { instance_double("Bow", is_a?: true, use: 1) }

  let(:empty_bow) { instance_double("Bow", is_a?: true, use: Exception) }

  before do
    allow($stdout).to receive(:puts)
  end

  describe "#initialize" do

    it "should accept name assignment" do
      expect(dex.name).to eq("Dex")
    end

    it "should accept a health attribute" do
      expect(dex.health).to eq(90)
    end

    it "should not allow health to be overwritten" do
      expect(dex).not_to respond_to(:health=)
    end

    it "should begin without a weapon" do
      expect(dex.weapon).to be_nil
    end

  end

  describe "#pick_up_weapon" do

    it "should raise an exception if you attempt to pick up a non-weapon" do
      expect {dex.pick_up_weapon("garbage")}.to raise_error("Can't pick up that thing")
    end

    it "should pick up a weapon" do
      dex.pick_up_weapon(bow)
      expect(dex.weapon).to eq(bow)
    end

  end

  describe "#drop_weapon" do

    it "should drop its weapon" do
      dex.pick_up_weapon(bow)
      dex.drop_weapon
      expect(dex.weapon).to be_nil
    end

  end

  describe "#receive_attack" do

    it "should reduce health when attacked" do
      dex.receive_attack(30)
      expect(dex.health).to eq(60)
    end

    it "should call take_damage" do
      expect(dex).to receive(:take_damage)
      dex.receive_attack(30)
    end

  end

  describe "#attack" do

    it "should reduce the attacked viking's health when it attacks" do
      dex.attack(sampson)
      expect(sampson.health).to be < 450
    end

    it "should call the attacked viking's take_damage" do
      expect(sampson).to receive(:take_damage)
      dex.attack(sampson)
    end

    it "should use fists if without weapon" do
      expect(dex).to receive(:damage_with_fists).and_return(dex.strength * 0.25)
      dex.attack(sampson)
    end

    it "should deal fist damage if attacking with fists" do
      expect(sampson).to receive(:receive_attack).with(dex.strength * 0.25)
      dex.attack(sampson)
    end

    it "should use a weapon if it has one" do
      expect(dex).to receive(:damage_with_weapon).and_return(1)
      dex.pick_up_weapon(bow)
      dex.attack(sampson)
    end

    it "should deal weapon damage if attacking with a weapon" do
      dex.pick_up_weapon(bow)
      expect(sampson).to receive(:receive_attack).with(dex.strength)
      dex.attack(sampson)
    end

    it "should use fists if out of arrows in bow" do
      dex.pick_up_weapon(empty_bow)
      expect(dex).to receive(:damage_with_fists).and_return(dex.strength * 0.25)
      dex.attack(sampson)
    end

    it "should raise an error of death if no health" do

      expect {dex.attack(dudebro)}.to raise_error("Dude has Died...")
    end

  end

end