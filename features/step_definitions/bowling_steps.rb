class Output
  
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end

def output
  @output ||= Output.new
end

Before do
  @game = Bowling::Game.new(output)
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @game.start	
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Given /^I am playing$/ do
  @game.roll(0)
end

When /^I end a game$/ do
  @game.send_score_message
  @game.send_finish_message
end

Then (/^I should see the next message "(.*?)"$/) do |message|
  output.messages.should include(message)
end


Then (/^I should see the next final message "(.*?)"$/) do |message|
  output.messages.should include(message)
end

				 
