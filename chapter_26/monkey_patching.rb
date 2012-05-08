class Fixnum
  alias_method :normal_addition, :+

  def + (number_to_add)
    self - number_to_add
  end
end


puts 9 + 6

puts 9.normal_addition 6
