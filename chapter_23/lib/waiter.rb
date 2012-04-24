class Waiter
  def bring_me_beer
    tender("beer")
  end

  def bring_me_scotch
    tender("scotch")
  end

  def tender(alcohol)
    "Here's the #{alcohol} you ordered."
  end

  def method_missing( name, *args)
    string_name = name.to_s
    return super unless string_name =~ /^bring_me\w+/
    drink = extract_drink(string_name)
    tender(drink)
  end

  def extract_drink(name)
    name.split('_')[2]
  end

  # def respond_to?(name)
  #   string_name = name.to_s
  #   return true if string_name =~ /^bring_me\w+/
  #   super
  # end
end
