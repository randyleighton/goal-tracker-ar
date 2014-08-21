class Team < ActiveRecord::Base

  has_many :players
  has_many :goals, through: :players

end
