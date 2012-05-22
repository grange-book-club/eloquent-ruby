require_relative 'game_machine'

class Arcade

  def initialize(file)
    @file = file
  end

  def play_a_game
    parse_game_file(@file)
  end

  private

  def parse_game_file(program_path)
    File.open(program_path) do |file|
      until file.eof?
        parse_statement(file.readline)
      end
    end
  end

  def parse_statement(statement)
    case statement
    when /Let's play a game of/
      @game_machine = GameMachine.new(retrieve_game_type(statement))
      @game_machine.play
    when /I have played enough/
      puts "That's ok, you can quit for now."
    else
      puts "We don't know that command."
    end
  end

  def retrieve_game_type(statement)
    statement.match(/Let's play a game of (.*)/)[1]
  end
end
