require_relative 'score_card'
class Player
  attr_reader :name, :score_card

  def initialize(name)
    @name = name
    @score_card = ScoreCard.new
  end

  def take_turn(frame)
    update_score(bowl(frame))
    # p score_card
  end

  def update_score(frame)
    score_card.update_score!(frame)
  end

  def bowl(frame)
    frame.roll!
  end

  def check_score
    score_card.check_score
  end
end

