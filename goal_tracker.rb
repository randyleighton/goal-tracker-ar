require 'active_record'
require './lib/game.rb'
require './lib/player.rb'
require './lib/team.rb'

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
    puts "(1) Add a Player"
    puts "(2) Add a Team"
    puts "(3) Add a Game\n\n"
    puts "[= REMOVE=]"
    puts "(4) Remove a Player"
    puts "(5) Remove a Team"
    puts "(6) Remove a Game\n\n"
    puts "[= VIEW =]"
    puts "(7) View a Player"
    puts "(8) View a Team"
    puts "(9) View a Game\n\n"
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
      view_players
    when '8'
      view_teams
    when '9'
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
  player_new = Player.new({name: name_inp, number: number_inp ,team_id: team_inp})
  puts "#{player_new.name} added."
end

def add_team
  print "Enter a team name: "
  team = gets.chomp
  new_team = Team.create({name: team})
  puts "#{new_team.name} created."
end

def add_game
  puts "\n\nEnter the date of the game in this format xxxx-xx-xx ie. 2014-08-17"
  choice = gets.chomp
end

def remove_player
end
def remove_team
end
def remove_game
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
  puts "(id) Date"
  puts "---- --------"
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
