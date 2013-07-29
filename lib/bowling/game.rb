module Bowling

  class Game
    
    def initialize (output)
      @output = output
      @game_score = 0
    end

    def start
      @output.puts 'Welcome to Bowling Game'
      @output.puts 'Enter a new roll:' 
		end

    def roll (pins)
      @game_score += pins
    end

    def calculate_score
      @game_score
    end
        
    def send_score_message
      @output.puts 'Your final score is:'
    end

    def send_finish_message
      @output.puts'Game finished'
    end

  end
end
