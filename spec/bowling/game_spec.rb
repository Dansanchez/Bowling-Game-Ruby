require 'spec_helper'

module Bowling
  
  describe Game do
    describe "#start" do
        let(:output) { double('output').as_null_object }
        let (:game)  { Game.new(output) }

      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Bowling Game')
        game.start
      end

      it "prompts for the firt roll" do
        output.should_receive(:puts).with('Enter a new roll:')
        game.start
      end
    end
  end

end
