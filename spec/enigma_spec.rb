require 'date'
require './lib/enigma'
require 'spec_helper'

RSpec.describe Enigma do
  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_instance_of(Enigma)
  end

  it "generate_key" do
    enigma = Enigma.new
    expect(enigma.generate_key).to be_instance_of("1")
  end

  it "encrypts" do
    enigma = Enigma.new
    expected = {message: "keder ohulw", key: "02715", date: "040895"}

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

end
