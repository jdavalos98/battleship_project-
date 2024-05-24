require 'spec_helper'

RSpec.describe Cell.new do
  before(:each) do
    @cell = Cell.new(coordinate)
    @cell1 = Cell.new("B4")
  end

  it "can initialize" do
    expect(@cell1.coordinate).to eq("B4")
  end
end