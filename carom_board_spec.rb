require_relative 'carom_board'
require 'pry'

RSpec.describe CaromBoard do
  before(:all) do
    @carom_board = CaromBoard.new
  end

  context 'Carom Board initial values' do
    it "should check for correct initial black coins count" do
      expect(@carom_board.black_coins).to eq(9)
    end

    it "should check initially red coin is not pocketed" do
      expect(@carom_board.is_red_coin_pocketed).to eq(false)
    end

    it "should check rules are defined" do
      expect(@carom_board.rules.empty?).to eq(false)
    end
  end

  context 'Carom board update' do
    it "should update black coins" do
      @carom_board.update(black_coins_value: -1, red_coin: false)
      expect(@carom_board.black_coins).to eq(8)
    end

    it "should update red coin" do
      @carom_board.update(black_coins_value: 0, red_coin: true)
      expect(@carom_board.is_red_coin_pocketed).to eq(true)
    end

    it "should check if board cleared" do
      @carom_board.update(black_coins_value: -8, red_coin: true)
      expect(@carom_board.coins_exhausted?).to eq(true)
    end
  end

  context 'Edge cases' do
    before(:all) do
      @carom_board = CaromBoard.new
    end
    it "should work when passed only black coins as arguments" do
      @carom_board.update(black_coins_value: -1)
      expect(@carom_board.black_coins).to eq(8)
    end

    it "should work when passed only red coin arguments" do
      @carom_board.update(red_coin: true)
      expect(@carom_board.is_red_coin_pocketed).to eq(true)
    end

    it "should not update red coin from true to false" do
      @carom_board.update(red_coin: false)
      expect(@carom_board.is_red_coin_pocketed).not_to eq(false)
    end

    it "should check already cleared board remains cleared" do
      @carom_board.update(black_coins_value: -10, red_coin: true)
      expect(@carom_board.coins_exhausted?).to eq(true)
    end

  end
end