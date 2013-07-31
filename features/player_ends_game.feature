Feature: player ends game

  As a player 
  I want to end the game
  So I can see my final score

Scenario: end game
  Given I am playing
  When I end a game
  Then I should see the next message "Your final score is:"
  And I should see the next final message "Game finished"

   
