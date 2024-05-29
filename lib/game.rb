require './lib/game_helper.rb'
class Game

  def initialize
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_board = Board.new
    @computer_board = Board.new
  end

  def run
  puts "Welcome to..." 
  puts "█████████████████████████████████████████████████████████" 
  puts "█▄─▄─▀██▀▄─██─▄─▄─█─▄─▄─█▄─▄███▄─▄▄─█─▄▄▄▄█─█─█▄─▄█▄─▄▄─█" 
  puts "██─▄─▀██─▀─████─█████─████─██▀██─▄█▀█▄▄▄▄─█─▄─██─███─▄▄▄█" 
  puts "▀▄▄▄▄▀▀▄▄▀▄▄▀▀▄▄▄▀▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀▄▀▄▀▄▄▄▀▄▄▄▀▀▀" 

  main_menu
  end

  def main_menu
    puts "Enter p to PLAY. Enter q to QUIT"
    choice = gets.chomp.downcase
    case choice 
    when "p" 
      setup_game
    when "q"
      exit
      "Hasta la vista baby"
    end
  end

  def setup_game
    place_computer_ships
    puts"I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render_board
    puts "Enter the coordinates for the Cruiser (3 adjacent spaces)"
    puts @computer_board.render_board(true)

    #player ship placement
  end

  def place_computer_ships
    @computer_board.place(@computer_cruiser, @computer_board.cells)
    @computer_board.place(@computer_submarine, @computer_board.cells)
  end
end

game = Game.new
game.run

