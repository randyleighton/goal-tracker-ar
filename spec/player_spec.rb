require 'spec_helper'

describe Player do

  it { should belong_to :team}
  it { should have_many :goals}
  it { should have_many(:games).through(:goals) }

  it "should verify number is entered as a numeric input" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'george', number: 'fff', team: new_team)
    new_player.save
    expect(new_player.errors[:number]).to eq ["is not a number"]
  end

end
