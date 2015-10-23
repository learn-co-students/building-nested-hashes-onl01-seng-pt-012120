require_relative 'spec_helper'
require_relative '../lib/bonus.rb'

describe "#bonus" do 
  # remove the 'x' from the 'xit' below to activate this test!
	xit "uses the []= method to change the hero and heroine's status from alive to dead" do 
    expect(bonus[:montague][:hero][:status]).to eq("dead")
    expect(bonus[:capulet][:heroine][:status]).to eq("dead")
    
  end
end