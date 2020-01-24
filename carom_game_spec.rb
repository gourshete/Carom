require_relative 'carom_game'

RSpec.describe CaromGame do

  before(:all) do
    @game = CaromGame.new
  end

  context 'should check initialization' do
    it "should check for player one class" do
      expect(@game.player_one.class.to_s).to eq('Player')
    end

    it "should check for player two class" do
      expect(@game.player_two.class.to_s).to eq('Player')
    end

    it "should check for carom board class" do
      expect(@game.carom_board.class.to_s).to eq('CaromBoard')
    end
  end

  context 'Check methods return type' do
    it "check_for_winner method should return boolean" do
      expect(@game.check_for_winner.class.to_s).to eq('FalseClass')
    end
  end

  context 'Check player moves' do
    it 'Should check for player one points updated' do
      @game.play(0, 0)
      expect(@game.player_one.points).to eq(1)
    end

    it 'Should check for player two points updated' do
      @game.play(1, 0)
      expect(@game.player_two.points).to eq(1)
    end

    it 'Should check for player two points updated for red coin' do
      @game.play(1, 2)
      expect(@game.player_two.points).to eq(4)
    end
  end
end