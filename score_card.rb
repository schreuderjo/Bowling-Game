class ScoreCard
  attr_reader :scores

  def initialize
    @scores = []
  end

  def update_score!(frame)
    scores << frame
  end

  def check_score
    scores
  end

end
