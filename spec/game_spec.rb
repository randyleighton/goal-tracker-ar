require 'spec_helper'

describe Game do

  it { should have_many :goals }
  it { should have_many(:players).through(:goals) }

end
