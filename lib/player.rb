class Player < ActiveRecord::Base

  belongs_to :team
  has_many :goals
  has_many :games, through: :goals

  before_save :capitalize_name
  validates :name, :presence => true, :length => {:maximum => 40}
  validates :number, :length => { is: 2 }
  #validates_numericality_of :number, :only_integer => true
  #why does numericality validation not work.

private

  def capitalize_name
    self.name = self.name.downcase.capitalize
  end

end
