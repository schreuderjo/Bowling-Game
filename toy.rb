class BowlingGame
  def initialize(players = [])
    @players = players
    @scores = []
  end

  def bowl(round = 1)
    return if round == 11
      # @players.each do |player|
      # end
      p "round: #{round}"
      @scores << take_turn
      p "total score: #{@scores}"
      p "================================"


      round += 1
    bowl(round)
  end

  def take_turn(turn = 1, max_pins = 10, round_score = [])
    return round_score.reduce(:+) if turn > 2
    pins = roll(max_pins)
    p "pins: #{pins}"
    p "turn: #{turn}"
    round_score << pins
    if pins == 10 && turn == 1
      turn += 2
      p "STRIKE!!!"
    elsif turn == 2 && round_score.reduce(:+) == 10
      turn += 1
      p "SPARE!!"
    else
      turn += 1
    end
    p "round score: #{round_score}"
    max_pins -= pins
    take_turn(turn, max_pins, round_score)
  end

  def roll(max_pins)
    [*0..max_pins].sample
  end

  def score(val)
    @scores << val
  end

  def print_score
    p @scores
  end
end

game = BowlingGame.new("a")
game.bowl

