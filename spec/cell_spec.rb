require 'spec_helper'

RSpec.describe Cell.new do
  before(:each) do
    @cell = Cell.new("B4")
  end

  it "can initialize" do
    expect(@cell.coordinate).to eq("B4")
  end
end