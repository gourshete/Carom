require 'pry'
require_relative 'player'

RSpec.describe Player do

  context 'Test updated points' do
    before(:all) do
      @player = Player.new('Test Player')
    end

    it "check for updated points" do
      @player.update(1)
      expect(@player.points).to eq(1)
    end
  end

  context 'Tests based on points history' do
    before(:all) do
      @player = Player.new('Test Player')
      @player.update(1)
      @player.update(2)
      @player.update(3)
      @player.update(-1)
      @player.update(2)
    end

    it "should update points history" do
      expect(@player.points_history).to match_array([1, 2, 3, -1, 2])
    end

    it "should update points" do
      expect(@player.points).to eq(7)
    end

    it "should not update points due to non-consecutive three_no_point" do
      expect(@player.points).to eq(7)
    end

    it "should update points due to consecutive three no points" do
      @player.update(0)
      @player.update(0)
      @player.update(0)
      expect(@player.points).to eq(6)
    end

    it "should update points due to three fouls" do
      @player.update(-1)
      @player.update(-2)
      @player.update(-1)
      expect(@player.points).to eq(1)
    end

    it "should update points due to three fouls" do
      @player.update(-1)
      @player.update(-1)
      expect(@player.points).to eq(-2)
    end

    it "should not update points due to non consecutive three no point" do
      @player.update(0)
      @player.update(1)
      @player.update(0)
      @player.update(0)
      expect(@player.points).not_to eq(-2)
    end

  end
end