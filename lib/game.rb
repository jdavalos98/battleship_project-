require './lib/game_helper.rb'
class Game

  def initialize
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_board = Board.new
    @computer_board = Board.new
    @cells =  ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
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
    place_computer_ships(@computer_cruiser, @computer_submarine)

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render_board
    puts "Enter the coordinates for the Cruiser (3 adjacent spaces), seperated by commas."

    choice = gets.chomp.upcase
    case  choice
    when  choice = @player_board.cells.any?
      @player_board.place(@player_cruiser, choice)
    end
    puts @player_board.render_board(true)
    

    #player ship placement
  end

  def place_computer_ships(computer_cruiser, computer_submarine)
    cruiser_coordinates = random_coordinates(@computer_cruiser, @computer_cruiser.length)
    sub_coordinates = random_coordinates(@computer_submarine, @computer_submarine.length)
    @computer_board.place(@computer_cruiser, cruiser_coordinates)
    @computer_board.place(@computer_submarine, sub_coordinates)
  end

  def random_coordinates(ship, length)
    loop do
      coordinates = @cells.sample(length)
      return coordinates if @computer_board.valid_placement?(ship, coordinates)
    end
  end


game = Game.new
game.run
end
