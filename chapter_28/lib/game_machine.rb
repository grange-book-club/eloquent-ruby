require_relative 'high_low'

class GameMachine

  def initialize(game)
    @game = choose_a_game(game)
  end

  def play
    @game.start
  end

  private

  def choose_a_game(game)
    case game
    when 'High Low'
      HighLow.new
    else
      puts "#{game} is not a valid game."
    end
  end
end
