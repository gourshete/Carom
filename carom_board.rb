class CaromBoard

  attr_accessor :black_coins, :is_red_coin_pocketed
  attr_reader :rules

  def initialize
    @black_coins = 9
    @is_red_coin_pocketed = false
    @rules = carom_rules
  end

  def update(black_coins_value: 0, red_coin: false)
    update_coins(black_coins_value: black_coins_value, red_coin: red_coin)
  end

  def coins_exhausted?
    check_coins_exhausted?
  end

  private
  def carom_rules
    [
        { name: 'Strike', points: 1, coins: -1 },
        { name: 'Multi-strike', points: 2, coins: -2 },
        { name: 'Red strike', points: 3, coins: 0 },
        { name: 'Striker strike', points: -1, coins: 0 },
        { name: 'Defunct coin', points: -2, coins: -1 },
        { name: 'No coin', points: 0, coins: 0 },
        { name: '3 No strikes', points: -1, coins: 0 },
        { name: '3 Fouls', points: -1, coins: 0 }
    ]
  end

  def update_coins(black_coins_value: 0, red_coin: false)
    self.black_coins += update_black_coins(black_coins_value)
    self.is_red_coin_pocketed = red_coin if red_coin
  end

  def update_black_coins(black_coins_value)
    [-black_coins, black_coins_value].max
  end

  def check_coins_exhausted?
    (self.black_coins == 0) && self.is_red_coin_pocketed
  end
end
