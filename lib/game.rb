class Game < ActiveRecord::Base

  has_many :goals
  has_many :players, through: :goals

end
