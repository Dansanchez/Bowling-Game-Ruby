module Bowling

  class Game
   
    def initialize (output)
      @output = output
    end

    def start
      @output.puts 'Welcome to Bowling Game'
      @output.puts 'Enter a new roll:'
    end

  end
end
