class View

  def render_welcome_screen
    <<-string

!!Welcome to Ruby Bowler!!
==========================
Type 'START' after entering
your player names to begin
the game.  Good Luck :)

    string
  end

  def render_ask_for_name
    "Please enter your player name:"
  end

  def render_current_score(score_card)
    score_card.scores.each do |frame|
      frame.to_s
    end

    # |------------------
    # | frame.to_s | F1, F2|
    # |------------------
    # | F1, F2 | F1, F2|
    # |----------------
  end

end
