# require_relative 'score_card'
require_relative 'player'
require_relative 'frame'


class Controller
  def initialize
    @view = View.new
    @players = []
  end

  def run
    puts @view.render_welcome_screen
    create_players
    play_game
  end

  def play_game
    #Run until round 10 is finished
    # return if round > 10
    @players.each do |player|
      puts "player #{player.name}."
      frame = Frame.new
      player.take_turn(frame)
      unless frame.strike? # create method
        frame.next_turn!
        player.take_turn(frame)
      end
      render_current_score(player.score_card)
      # frame.first_roll
      # p player
    end
  end

  def render_current_score(score_card)
    puts @view.render_current_score(score_card)
  end

  def create_players
    puts @view.render_ask_for_name
    name = gets.chomp
    return if name.downcase == "start"
    @players << Player.new(name)
    create_players
  end

end
    #LOOP until 10 rounds have been completed
      #FOR each round of bowling
        #FOR each player
          #the player should bowl
            #IF they bowl a 10 on the first round
              #the score should record an X (10 + value of the next 2 rolls)
            #ELSE
              #the score should update with the new value
            #END
          #the player should bowl again unless they got a strike
            #IF the player bowled a strike
              #the score should record a / (10 + value of the next roll)
