require 'active_record'
require 'rspec'
require 'game'
require 'player'
require 'team'
require 'goal'
require 'pry'
require 'shoulda-matcher'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Game.all.each { |game| game.destroy }
    Player.all.each {|player| player.destroy}
    Team.all.each {|team| team.destroy}
  end
end
