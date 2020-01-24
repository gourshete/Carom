require 'pry'
require_relative 'player'
require_relative 'carom_board'

class CaromGame

  attr_accessor :carom_board, :player_one, :player_two

  def initialize
    @player_one = Player.new('One')
    @player_two = Player.new('Two')
    @carom_board = CaromBoard.new
  end

  def play(player, move)
    if move == 2
      update_red(player, move)
    elsif [0,1,3,4,5].include? move
      update_black(player, move)
    else
      update_black(player, 5)
    end
  end

  def is_finished
    if is_valid_winner?(player_one, player_two)
      return 0
    elsif is_valid_winner?(player_two, player_one)
      return 1
    end
    if board_cleared?
      2
    end
  end

  private
  def update_red(player, move)
    ### Check for - Red coin cannot be pocketed more than once
    update_red_coin_points = carom_board.is_red_coin_pocketed ? false : true
    if update_red_coin_points
      carom_board.update(black_coins_value: 0, red_coin: true)
      update_points(player, move)
    end
  end

  def update_black(player, move)
    black_coins = carom_board.rules[move][:coins]
    carom_board.update(black_coins_value: black_coins, red_coin: false)
    update_points(player, move)
  end

  def update_points(player, move)
    if player == 0
      player_one.update(carom_board.rules[move][:points])
    else
      player_two.update(carom_board.rules[move][:points])
    end
  end

  def is_valid_winner?(ahead_player, behind_player)
    (ahead_player.points >= 5) && ((ahead_player.points - behind_player.points) >= 3)
  end

  def board_cleared?
    carom_board.coins_exhausted?
  end
end
