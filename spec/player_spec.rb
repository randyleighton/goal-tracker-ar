require 'spec_helper'

describe Player do
  it { should belong_to :team}
  it { should have_many :goals}
  it { should have_many(:games).through(:goals) }
  it "should lowercase and capitalize names before saving" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'george', number: 12, team: new_team)
    new_player.save
    expect(new_player.name).to eq 'George'
  end
  it "should verify number is entered as a numeric input" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'george', number: 'ff', team: new_team)
    new_player.save
    expect(new_player.errors[:number]).to eq ["is not a number"]
  end
  it "should verify number entered is a maximum of 2 characters" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'george', number: 123, team: new_team)
    new_player.save
    expect(new_player.errors[:number]).to eq ["is too long (maximum is 2 characters)"]
  end
  it "should verify the name is entered" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'george', number: 12, team: new_team)
    new_player.save
    expect(new_player.valid?).to eq true
  end
  it "should verify the name is not longer than 40 characters" do
    new_team = Team.new(name: 'manchester')
    new_player = Player.new(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', number: 12, team: new_team)
    new_player.save
    expect(new_player.valid?).to eq false
  end
end
