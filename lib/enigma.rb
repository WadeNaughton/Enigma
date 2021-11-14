class Enigma

  attr_reader :characters, :date

  def initialize
    @characters = ("a".."z").to_a << " "
    @date = Time.now.strftime("%m%d%y")
  end

  def generate_key
    key = rand(99999).to_s.rjust(5, "0")
  end

  def generate_date
    @date
  end

  def encrypt(encryption, key = generate_key, date = generate_date)
    encrypt_hash = Hash.new(0)

    a_key = key.slice(0..1).to_i
    b_key = key.slice(1..2).to_i
    c_key = key.slice(2..3).to_i
    d_key = key.slice(3..4).to_i

    date_int = date.to_i
    date_squared = date_int ** 2
    date_string = date_squared.to_s
    date_split = date_string.split(//)
    date_split_slice = date_split.slice(6..9)
    a_offset = date_split_slice[0].to_i
    b_offset = date_split_slice[1].to_i
    c_offset = date_split_slice[2].to_i
    d_offset = date_split_slice[3].to_i

    a_shift = a_key + a_offset
    b_shift = b_key + b_offset
    c_shift = c_key + c_offset
    d_shift = d_key + d_offset

    message_split = encryption.split(//)

    empty_array = []

    message_split.each_with_index do |value, index|
      if index % 4 == 0
        first_shift = @characters.index(value) + a_shift
        empty_array << @characters[first_shift % 27]

      elsif index % 4 == 1
        second_shift = @characters.index(value) + b_shift
        empty_array << @characters[second_shift % 27]

      elsif index % 4 == 2
        third_shift = @characters.index(value) + c_shift
        empty_array << @characters[third_shift % 27]

      elsif index % 4 == 3
        fourth_shift = @characters.index(value) + d_shift
        empty_array << @characters[fourth_shift % 27]

      end
    end
    message = empty_array.join("")
    encrypt_hash.merge!(key: key, date: date, message: message)
  end

  def decrypt(encryption, key = generate_key, date = generate_date)
    encrypt_hash = Hash.new(0)

    a_key = key.slice(0..1).to_i
    b_key = key.slice(1..2).to_i
    c_key = key.slice(2..3).to_i
    d_key = key.slice(3..4).to_i

    date_int = date.to_i
    date_squared = date_int ** 2
    date_string = date_squared.to_s
    date_split = date_string.split(//)
    date_split_slice = date_split.slice(6..9)
    a_offset = date_split_slice[0].to_i
    b_offset = date_split_slice[1].to_i
    c_offset = date_split_slice[2].to_i
    d_offset = date_split_slice[3].to_i

    a_shift = a_key + a_offset
    b_shift = b_key + b_offset
    c_shift = c_key + c_offset
    d_shift = d_key + d_offset

    message_split = encryption.split(//)

    empty_array = []

    message_split.each_with_index do |value, index|
      if index % 4 == 0
        first_shift = @characters.index(value) - a_shift
        empty_array << @characters[first_shift % 27]

      elsif index % 4 == 1
        second_shift = @characters.index(value) - b_shift
        empty_array << @characters[second_shift % 27]

      elsif index % 4 == 2
        third_shift = @characters.index(value) - c_shift
        empty_array << @characters[third_shift % 27]

      elsif index % 4 == 3
        fourth_shift = @characters.index(value) - d_shift
        empty_array << @characters[fourth_shift % 27]

      end
    end
    message = empty_array.join("")
    encrypt_hash.merge!(key: key, date: date, message: message)

  end

end
