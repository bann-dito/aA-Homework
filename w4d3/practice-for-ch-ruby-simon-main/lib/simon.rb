class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

    until game_over
      take_turn
    end
      game_over_message
      reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    p seq
    sleep 0.5
    system("clear")
  end

  def require_sequence
    p "Enter the colors shown"
    answer = gets.chomp.split
    if answer != seq
      @game_over = true
    end
  end

  def add_random_color
    split = COLORS
    @seq << split.sample
  end

  def round_success_message
    p "Colors matched correctly!"
  end

  def game_over_message
    system "clear"
    p "better luck next time, you made it to #{sequence_length - 1} guesses correctly"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end