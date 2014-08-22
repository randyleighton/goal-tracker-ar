class Player < ActiveRecord::Base

  belongs_to :team
  has_many :goals
  has_many :games, through: :goals

  before_save :capitalize_name

  validates :name, :presence => true, :length => {:maximum => 40}
  validates :number, :length => { maximum: 2 }, :numericality => { only_integer: true }

private

  def capitalize_name
    self.name = self.name.downcase.capitalize
  end

end
