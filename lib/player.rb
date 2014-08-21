class Player < ActiveRecord::Base

  belongs_to :team
  has_many :goals
  has_many :games, through: :goals

end
