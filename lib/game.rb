require './lib/game_helper.rb'
class Game

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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
    end
  end

  def setup_game
    #computer ship placement
    puts"I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    #player ship placement


  end
end

game = Game.new
game.run

