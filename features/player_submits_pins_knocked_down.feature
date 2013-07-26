Feature: player submits the number of pins knocked down

  The game consists of ten frames, each frame has two rolls, the player
  has two tries to knock down 10 pins. The game will accumulate a score
  after each roll, depending on the number of pins that the player knocked
  down. There are four different situations for calculating the score:

  1) If the player don't knocked down the ten pins with the two rolls, then
     the score of the current frame will be the number of pins knocked down 
     with the first roll plus the number of pins knocked down with the second 
     roll.
  2) If the player knocked down the ten pins using the two rolls, then the 
     score of the current frame will be 10 plus the number of pins knocked
     down with the next two rolls of the next frame.
  3) If the player knocked down the ten pins using just the first roll (strike),
     then the score of the current frame will be 10 plus the number of pins
     knocked down with the next two rolls of the next frame.
  4) In the tenth frame, if the player rolled a spare then he gets an extra ball
     to complete the spare, if the player rolled a strike then he gets two more
     rolls to complete the strike, in any other case the game end with the 
     normal two rolls of the frame. 


  Scenario Outline: submit number of pins
    Given I knocked "<pinsFirstRoll>" pins in the first roll
    When  I knocked "<pinsNextRoll>" pins in the next roll
    And   I knocked "<pinsThirdRoll>" pins in the third roll
    Then  The score should be "<score>"


   Scenarios:Less than ten pins knocked down with the first two rolls, anything in the third roll
     | pinsFirstRoll | pinsNextRoll   | pinsThirdRoll | score |
     |     0         |       3        |       5       |   3   | 
     |     5         |       3        |       1       |   8   | 
     |     2         |       0        |       0       |   2   |
     |     0         |       0        |       5       |   0   |

    
   Scenarios:Spare with the first two rolls, anything in the third roll
     | pinsFirstRoll | pinsNextRoll   | pinsThirdRoll | score |
     |      0        |      10        |       0       |   10  |  
     |      6        |       4        |      10       |   20  |
       
   
   Scenarios:Strike with the first roll, anything in the next two rolls
     | pinsFirstRoll | pinsNextRoll   | pinsThirdRoll | score |
     |     10        |       3        |       5       |   18  | 
    


