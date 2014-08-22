class Game < ActiveRecord::Base

  has_many :goals
  has_many :players, through: :goals

  def self.date_search(start_date, end_date)
    all_games = self.where(:game_date => start_date..end_date)
    all_games
  end

end
