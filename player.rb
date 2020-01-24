class Player
  attr_accessor :points, :name, :points_history
  def initialize(name)
    @points = 0
    @name = name
    @points_history = []
  end

  def update(value)
    set_points(value)

    self.points_history << value

    check_for_three_no_point

    check_for_three_fouls
  end

private
  def set_points(value)
    self.points += value
  end

  def check_for_three_no_point
    if points_history.length>2
      fh = points_history[points_history.length - 3, points_history.length]
      fh.select!{ |r| r==0 }
      set_points(-1) if fh.length==3
    end
  end

  def check_for_three_fouls
    if points_history.length>2
      fh = points_history.select{ |r| r==-1 || r==-2 }
      value = fh.length>0 ? (fh.length)%3 : 1
      set_points(-1) if value==0
    end
  end
end