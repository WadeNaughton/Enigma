require './enigma'
require 'date'

enigma = Enigma.new
message = File.open(ARGV[0], "r")

test = message.read
message.close

example = enigma.encrypt(test.strip)

writer = File.open(ARGV[1], "w")

test1 = writer.write(example[:encryption])

writer.close

p "Created 'encrypted.txt' with the key #{example[:key]} and date #{example[:date]}"
