class HighLow

  def initialize(min = 1, max = 100)
    @min = min
    @max = max
  end

  def start
    setup
    play_the_game
    wrap_up
  end

  private

  def setup
    @number_to_guess = random(@min,@max)
    @number_of_guesses = 0
  end

  def random(min_seed, max_seed)
    Random.rand(min_seed...max_seed)
  end

  def play_the_game
    not_finished = true

    while not_finished
      guess = get_players_guess
      break if quitting?(guess)
      not_finished = correct_guess?(guess)
      @number_of_guesses += 1
    end
  end

  def get_players_guess
    puts "Guess an integer between #{@min} and #{@max}, enter 'q' to quit"
    guess = gets
  end

  def quitting?(guess)
    guess =~ /q/i
  end

  def correct_guess?(guess)
    verify_input(guess)
    guess = guess.to_i
    if guess == @number_to_guess
      puts "You have guessed the number correctly!"
      false
    else
      next_round = guess_high_or_low(guess)
      puts "Your guess is too #{next_round[:current]}, try a #{next_round[:next]} number."
      true
    end
  end

  def verify_input(guess)
    begin
      Integer(guess)
    rescue ArgumentError => e
      raise e
    end
  end

  def guess_high_or_low(guess)
    next_round = Hash.new
    if guess < @number_to_guess
      next_round[:current] = "low"
      next_round[:next] = "higher"
    else
      next_round[:current] = "high"
      next_round[:next] = "lower"
    end
    next_round
  end

  def wrap_up
    puts "You have finished the game. You made #{@number_of_guesses} guesses."
  end
end
