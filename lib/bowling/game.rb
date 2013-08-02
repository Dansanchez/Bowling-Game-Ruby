module Bowling

 #CONSTANTS
  FRAMES_AMOUNT = 10

  class Game 
 
    attr_accessor :rolls_array
    
    def initialize (output)
      @output = output
      @rolls_array = Array.new(20)
      @current_roll = 0
      @rolls_per_frame = 2
      @current_frame = 1
    end

    def start
      @output.puts 'Welcome to Bowling Game' 
    end

    def play
      while game_is_not_over?
        roll(get_keyboard_new_roll)
        send_current_frame_message   
        verify_current_frame      
      end
      send_score_message
      @score = Score.new (@rolls_array)
      puts @score.calculate_score
      send_finish_message
    end

    def game_is_not_over?
      @current_frame < 11
    end

    def get_keyboard_new_roll
      print "Enter a new roll: "
      new_roll = gets.chomp 
      new_roll.to_i
    end
    
    def roll (knocked_down_pins_number)
      @rolls_array[@current_roll] = knocked_down_pins_number
      @current_roll += 1
    end
     
    def verify_current_frame
      if tenth_frame? 
        make_tenth_frame_rolls
      else
        go_to_next_frame
      end
    end

    def tenth_frame?
      @current_frame == 10
    end

    def make_tenth_frame_rolls
      roll(get_keyboard_new_roll)
      send_current_frame_message
      verify_an_extra_roll
    end

    def verify_an_extra_roll
      if spare_in_frame? || strike_in_frame?
        make_extra_roll
      end
      @current_frame += 1
    end

    def make_extra_roll
      roll(get_keyboard_new_roll)
      send_current_frame_message
    end

    def go_to_next_frame
      if normal_roll?
        substract_roll_from_frame
      end
      if frame_done?
        move_to_next_frame
      end
    end  

    def normal_roll?
      @rolls_array[@current_roll-1] < 10
    end

    def substract_roll_from_frame
      @rolls_per_frame -= 1
    end  

    def frame_done?
      (strike_in_frame? && !tenth_frame?) || normal_frame_complete?
    end

    def move_to_next_frame
      @current_frame += 1
      @rolls_per_frame = 2
    end

    def spare_in_frame?
      @rolls_array [@current_roll-1] + @rolls_array[@current_roll-2] == 10
    end

    def strike_in_frame?
      @rolls_array[@current_roll-1] == 10
    end

    def normal_frame_complete? 
      @rolls_per_frame == 0
    end

    def send_current_frame_message
      print "Frame: ",@current_frame,"\n"
    end

    def send_score_message
      @output.puts 'Your final score is:'
    end

    def send_finish_message
      @output.puts'Game finished'
    end

  end
end
