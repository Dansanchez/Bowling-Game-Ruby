module Bowling

  class Game
    
    def initialize (output)
      @output = output
      @game_score = 0
      @rolls_array = Array.new(20)
      @current_roll = 0
    end

    def start
      @output.puts 'Welcome to Bowling Game'
      @output.puts 'Enter a new roll:' 
		end

    def roll (knocked_down_pins_number)
      @rolls_array[@current_roll] = knocked_down_pins_number
      @current_roll += 1 
    end

    def calculate_score
      @rolls_array.each {|current_roll| @game_score += current_roll }
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
