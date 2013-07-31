module Bowling

 #CONSTANTS
  FRAMES_AMOUNT = 10

  class Game 
    
    def initialize (output)
      @output = output
      @game_score = 0
      @rolls_array = Array.new(20)
      @current_roll = 0
      @frame_first_roll = 0
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
      for current_frame in (0..FRAMES_AMOUNT-1)
        if strike?
          add_strike_score 
        elsif spare?
          add_spare_score
        else
          add_normal_score
        end
      end
      @game_score
    end

    def add_strike_score 
      @game_score += 10 + next_two_balls_strike
      @frame_first_roll += 1
    end

    def add_spare_score
      @game_score += 10 + next_ball_spare
      @frame_first_roll += 2
    end

    def add_normal_score
      @game_score += two_balls_in_frame
      @frame_first_roll += 2
    end
 
    def spare?
      @rolls_array[@frame_first_roll] + @rolls_array[@frame_first_roll+1] == 10
    end
       
    def strike?
      @rolls_array[@frame_first_roll] == 10   
    end

    def next_two_balls_strike  
      @rolls_array[@frame_first_roll+1] + @rolls_array[@frame_first_roll+2]
    end 

    def next_ball_spare
      @rolls_array[@frame_first_roll+2]
    end

    def two_balls_in_frame
      @rolls_array[@frame_first_roll] + @rolls_array[@frame_first_roll+1]           
    end

    def send_score_message
      @output.puts 'Your final score is:'
    end

    def send_finish_message
      @output.puts'Game finished'
    end

  end
end
