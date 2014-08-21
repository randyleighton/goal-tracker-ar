require 'active_record'
require './lib/game.rb'
require './lib/player.rb'
require './lib/team.rb'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def  main_menu
  system("clear")
  choice = nil
  until choice  == 'x'
    puts "[== Main Menu==]"
    puts "(1) Data Management Menu"
    puts "    * Add/Remove/View"
    puts "    * players/teams/game dates\n\n"
    puts "(2) Goal Management Menu"
    puts "    * add/view/remove goals\n\n"
    puts "(x) Exit Goal Tracker\n\n"
    print "Enter Choice: "
    choice = gets.chomp
    case choice
    when '1'
      data_menu
    when '2'
      goal_menu
    when 'x'
      puts "Thank you for using goal tracker"
    else
      puts "Incorrect choice."
    end
  end
end

def data_menu
  system("clear")
  choice = nil
  until choice  == 'x'
    puts "[== Data Menu ==]\n\n"
    puts "[= ADD =]"
    puts "(1) Add Player"
    puts "(2) Add Team"
    puts "(3) Add Game\n\n"
    puts "[= REMOVE=]"
    puts "(4) Remove Player"
    puts "(5) Remove Team"
    puts "(6) Remove Game\n\n"
    puts "[= VIEW =]"
    puts "(7) View Player Detail"
    puts "(8) View Team Detail"
    puts "(9) View Game Detail"
    puts "[= VIEW ALL =]"
    puts "(10) View all Players"
    puts "(11) View all Teams"
    puts "(12) View all Games\n\n"
    puts "[= EXIT=]"
    puts "(x) Exit to Main Menu\n\n"
    print "Enter Choice: "
    choice = gets.chomp
    case choice
    when '1'
      add_player
    when '2'
      add_team
    when '3'
      add_game
    when '4'
      remove_player
    when '5'
      remove_team
    when '6'
      remove_game
    when '7'
      view_player
    when '8'
      view_team
    when '9'
      view_game
    when '10'
      view_players
    when '11'
      view_teams
    when '12'
      view_games
    when 'x'
      puts "returning to main menu"
    else
      puts "Incorrect choice."
    end
  end
end

def goal_menu
  system("clear")
  choice = nil
  until choice  == 'x'
    puts "[== Goal Menu ==]\n\n"
    puts "(1) Add a goal to a player"
    puts "(2) View goals by player"
    puts "\n"
    puts "(x) Exit to Main Menu\n\n"
    print "Enter Choice: "
    choice = gets.chomp
    case choice
    when '1'
      add_goal
    when '2'
      view_goals
    when 'x'
      puts "returning to main menu."
    else
      puts "Incorrect choice."
    end
  end
end

def add_player
  print "\n\nEnter a player's last name: "
  name_inp = gets.chomp
  print "\nEnter the player's number: "
  number_inp = gets.chomp.to_i
  puts "\n\n"
  view_teams
  print "\nChoose the [#] of the player's team: "
  team_inp = gets.chomp.to_i
  player_new = Player.create({name: name_inp, number: number_inp ,team_id: team_inp})
  puts "#{player_new.name} added."
end

def add_team
  print "\n\nEnter a team name: "
  team = gets.chomp
  new_team = Team.create({name: team})
  puts "#{new_team.name} created."
end

def add_game
  print "\n\nEnter the date of the game yyyy/mm/dd: "
  game_date = gets.chomp
  print "\n\nEnter the [#] of the Home Team: "
  home_team = gets.chomp.to_i
  print "\n\nEnter the [#] of the Visiting Team: "
  visitor_team = gets.chomp.to_i
  new_game = Game.create(game_date: game_date,home_id: home_team ,visitor_id:visitor_team)
  puts "Game on #{new_game.game_date} between #{new_game.home_id} and #{new_game.visitor_id} entered."
end

def remove_player
  view_players
  print "\n\nPlayer (#) to delete: "
  remove_input = gets.chomp.to_i
  current_player = Player.find(remove_input)
  puts "Destroying #{current_player.name}."
  current_player.destroy
end
def remove_team
  view_teams
  print "\n\nTeam (#) to delete: "
  team_input = gets.chomp.to_i
  current_team = Team.find(team_input)
  puts "Destroying #{current_team.name}."
  current_team.destroy
end
def remove_game
  view_games
  print "\n\nGame (#) to delete: "
  game_input = gets.chomp.to_i
  current_game = Game.find(game_input)
  puts "Destroying Game Id: #{current_game.id}"
  current_game.destroy
end

def view_player
  system("clear")
  view_players
  puts "\nChoose (#) for player detail"
  player_choice = gets.chomp.to_i
  current_player = Player.find(player_choice)
  puts "Player Name: #{current_player.name}"
  puts "Player Number: #{current_player.number}"
  puts "Player Team: #{current_player.team.name}"
  puts "\n\n"
end

def view_team
  system("clear")
  view_teams
  puts "\nChoose (#) for team detail"
  team_choice = gets.chomp.to_i
  current_team = Team.find(team_choice)
  puts "Team Name: #{current_team.name}"
  puts "\nPlayer list:"
  current_team.players.each do |player|
    puts "* #{player.name} ##{player.number}"
  end
  puts "\n\n"
end

def view_game
  system("clear")
  view_games
  puts "\nChoose (#) for game detail"
  game_choice = gets.chomp.to_i
  current_game = Game.find(game_choice)
  home_team = Team.find(current_game.home_id)
  visitor_team = Team.find(current_game.visitor_id)
  puts "Game Detail: "
  puts " Date: #{current_game.game_date.strftime "%Y-%m-%d"}"
  puts " Home team: #{home_team.name}"
  puts " Visit team: #{visitor_team.name}"
  puts "\n\n"
end

def view_players
  system("clear")
  puts "Players:"
  puts "(id) Name - Jersey#"
  puts "---- --------------"
  Player.all.each do |player|
    puts "(#{player.id}) #{player.name} #{player.number}"
  end
  puts "\n\n"
end

def view_teams
  system("clear")
  puts "Teams:"
  puts "(id) Team Name"
  puts "---- ---------------------"
  Team.all.each do |team|
    puts "(#{team.id}) #{team.name}"
  end
  puts "\n\n"
end

def view_games
  system("clear")
  puts "Games:"
  puts "(id) Date       Home ID  Visit ID"
  puts "---- ---------------------------"
  Game.all.each {|game| puts "(#{game.id}) #{game.game_date.strftime "%Y-%m-%d"}   #{game.home_id}       #{game.visitor_id}"}
  puts "\n\n"
end

def add_goal
  system("clear")
  view_players
  puts "choose a player id (#) to add a goal:"
  player_inp = gets.chomp.to_i
  view_games
  puts "\n\nChoose the (#) of the game the player scored in: "
  game_inp = gets.chomp.to_i
end

def view_goals
  system("clear")
  view_players
  puts "choose a player id (#) to view their games with goals: "
  player_inp = gets.chomp.to_i
end




main_menu
