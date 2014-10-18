class Frame
  attr_reader :score
  attr_accessor :turn

  def initialize
    @pins = 10
    @turn = 0
    @score = [0,0]
  end

  def roll!
    value = [*0..@pins].sample
    @pins -= value
    score[@turn] = value
    self
  end

  def strike?
    score[0] == 10
  end

  def next_turn!
    @turn += 1
  end

  def to_s
    "#{score[0]}, #{score[1]}"
  end
end
