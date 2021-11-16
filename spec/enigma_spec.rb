require_relative './spec_helper'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_instance_of(Enigma)
  end

  it "has key generator" do
    enigma = Enigma.new
    expect(enigma.generate_key).to be_instance_of(String)
  end

  it "has date" do
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    expect(enigma.generate_date).to eq(date)
  end

  it "encrypts" do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it "encrypts with special characters" do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}

    expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
  end

  it "encrypts with todays date" do
    enigma = Enigma.new
    expected = {:key=>"02715", :date=>"161121", :encryption=>"qkhdxfsg r "}

    expect(enigma.encrypt("hello world", "02715")).to eq(expected)
  end

  it "encrypts with lower case values" do
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    expect(enigma.encrypt("Hello world", "02715", "040895")).to eq(expected)
  end

  it "decrypts" do
    enigma = Enigma.new
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it "decrypts with special characters" do
    enigma = Enigma.new
    expected = {decryption: "hello world!", key: "02715", date: "040895"}

    expect(enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(expected)
  end

  it "decrypts with lower case values" do
    enigma = Enigma.new
    expected = {decryption: "hello world!", key: "02715", date: "040895"}

    expect(enigma.decrypt("KEDER ohulw!", "02715", "040895")).to eq(expected)
  end

end
