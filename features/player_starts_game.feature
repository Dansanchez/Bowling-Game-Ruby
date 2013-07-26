Feature: player starts game

 As a player 
 I want to start a bowling game
 So that I can do many rolls and get a socore

 Scenario: start game
   Given I am not yet playing
   When I start a new game
   Then I should see "Welcome to Bowling Game"
   And I should see "Enter a new roll:"
