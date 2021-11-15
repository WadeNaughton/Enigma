require './enigma'
require 'date'

enigma = Enigma.new
file_1 = File.open(ARGV[0], "r")

incoming_text = file_1.read
file_1.close

example = enigma.encrypt('hello world')

writer = File.open(ARGV[1], "w")

writer.write(example)

writer.close

p "Created 'encrypted.txt' with the key #{enigma.generate_key} and date #{enigma.generate_date}"
