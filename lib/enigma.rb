class Enigma


  def initialize
    @characters = ("a".."z").to_a << " "
  end


  def generate_key
    key = rand(99999).to_s.rjust(5, "0")
  end

  def encrypt(encryption, key = generate_key, date)
    encrypt_hash = Hash.new(0)

    key = "02715"
    a_key = key.slice(0..1).to_i
    b_key= key.slice(1..2).to_i
    c_key = key.slice(2..3).to_i
    d_key = key.slice(3..4).to_i
    all_keys = a_key, b_key, c_key, d_key

    date = "040895"
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

    

    require "pry"; binding.pry


  end


end
