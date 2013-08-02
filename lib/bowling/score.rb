module Bowling

  class Score

  def initialize(rolls_array)
    @frame_first_roll = 0
    @rolls_array = rolls_array
    @game_score = 0
  end  
  

  def calculate_score
     for current_frame in (0..FRAMES_AMOUNT-1)
       add_roll_score
     end
     @game_score
   end

   def add_roll_score
     if strike?
       add_strike_score 
     elsif spare?
       add_spare_score
     else
       add_normal_score
     end
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
  
  end 

end
