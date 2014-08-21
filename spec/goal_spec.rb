require 'spec_helper'


describe Goal do

  it { should belong_to :game}
  it { should belong_to :player}

end
