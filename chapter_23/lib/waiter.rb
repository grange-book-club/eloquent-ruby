class Waiter
  def bring_me_beer
    tender("beer")
  end

  def bring_me_scotch
    tender("scotch")
  end

  def tender(alcohol)
    puts "Here's the #{alcohol} you ordered."
  end

end
