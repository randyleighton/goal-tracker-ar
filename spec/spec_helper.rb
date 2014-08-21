require 'active_record'
require 'rspec'
require 'game'
require 'player'
require 'team'
require 'goal'
require 'pry'
require 'shoulda-matchers'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Game.all.each {|game| game.destroy}
    Player.all.each {|player| player.destroy}
    Team.all.each {|team| team.destroy}
    Goal.all.each {|goal| goal.destroy}
  end
end
