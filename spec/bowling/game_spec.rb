require 'spec_helper'

module Bowling
  
  describe Game do
    let(:output) { double('output').as_null_object }
    let (:game)  { Game.new(output) }

    def roll_many(rolls_number,knocked_down_pins_number)
      for current_roll in (0..rolls_number)
        game.roll(knocked_down_pins_number)
      end
    end

    def roll_spare
      game.roll(5)
      game.roll(5)
    end 

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Bowling Game')
        game.start
      end

      it "prompts for the firt roll" do
        output.should_receive(:puts).with('Enter a new roll:')
        game.start
      end
    end
    
    describe "#game final score" do
      it "Roll a gutter game" do
        roll_many(19,0)
        game.calculate_score.should == 0
      end
      
      it "Roll all ones" do
        roll_many(19,1) 
        game.calculate_score.should == 20
      end

      it "Roll one spare" do
        roll_spare
        game.roll(3)
        roll_many(17,0)
        game.calculate_score.should == 16
      end
   end

    

    describe "#end" do
      it "sends a score message" do
        output.should_receive(:puts).with('Your final score is:')
        game.send_score_message
      end    

      it "sends a finish message" do
        output.should_receive(:puts).with('Game finished')
        game.send_finish_message
      end
    end
  end
end
