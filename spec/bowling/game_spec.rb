require 'spec_helper'

module Bowling
  
  describe Game do
    let(:output) { double('output').as_null_object }
    let (:game)  { Game.new(output) }

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
