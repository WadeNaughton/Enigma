require './enigma'
require 'date'

enigma = Enigma.new
encrypted_message = File.open(ARGV[0], "r")

key = ARGV[2]
date = ARGV[3]

test_1 = encrypted_message.read
encrypted_message.close

decrypt_message = enigma.decrypt(test_1.strip, key, date)

writer = File.open(ARGV[1], "w")

writer.write(decrypt_message[:decryption])
writer.close

p "Created 'decrypted.txt' with the key #{key} and date #{date}"
