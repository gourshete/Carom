require_relative 'carom_game'

class Play
  attr_accessor :player_one_moves, :player_two_moves, :game

  VALID_GAME_FINISH_FLAGS = [0, 1, 2].freeze

  def initialize
    @game = CaromGame.new
    @player_one_moves, @player_two_moves = read_input
  end

  def run
    response = nil
    (0...input_length).to_a.each do |i|
      game.play(0, player_one_moves[i]-1)
      game.play(1, player_two_moves[i]-1)
      response = game.is_finished
      break if VALID_GAME_FINISH_FLAGS.include? response
    end
    response
  end

  def call
    response = run
    print_result response
  end

  private
  def print_result(input)
    result = case input
             when 0
               'Winner is Player 1'
             when 1
               'Winner is Player 2'
             else
               'Match is draw'
             end
    puts result
  end

  def read_input
    p1 = File.read('player_one_input.txt').split(',').map(&:to_i)
    p2 = File.read('player_two_input.txt').split(',').map(&:to_i)
    return p1, p2
  end

  def input_length
    [player_one_moves.length, player_two_moves.length].min
  end

end

Play.new.call