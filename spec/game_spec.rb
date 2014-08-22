require 'spec_helper'

describe Game do

  it { should have_many :goals }
  it { should have_many(:players).through(:goals) }

  it "should find games in a date range" do
    test_game1 = Game.create({game_date: "2014-08-19"})
    test_game2 = Game.create({game_date: "2014-08-17"})
    test_game3 = Game.create({game_date: "2014-03-08"})
    expect(Game.date_search("2014-08-16", "2014-08-20")).to eq [test_game1, test_game2]
  end

end
