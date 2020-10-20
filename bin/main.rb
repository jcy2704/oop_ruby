#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

on = true

system 'clear'
system 'cls'

puts ''
puts 'Welcome to Tic Tac Toe! To play use X or O to fill the spaces on the board and try to connect 3.'
puts ''

sleep 1

puts 'Enter your name Player 1: '
nickname1 = gets.chomp.capitalize
player_one = Player.new(nickname1)
puts ''

puts 'Enter your name Player 2: '
nickname2 = gets.chomp.capitalize
player_two = Player.new(nickname2)
puts ''
token1 = player_one.token
puts "#{nickname1} will be #{token1}"
puts ''
token2 = leftover(token1, token2)
puts "#{nickname2} will be #{token2}"
puts ''

puts 'Displaying the game board'
puts ''

sleep 2

d_board = Board.new

system 'clear'
system 'cls'

puts ''
puts d_board.display_boards
puts ''

turn = 1
while on == true
  checked = false
  until checked == true
    if turn.odd?
      puts "#{nickname1} is your turn! What will be your play?"
      token = token1
    else
      puts "#{nickname2} is your turn! What will be your play?"
      token = token2
    end
    position = gets.chomp
    check = d_board.check(position)
    if check == 'INVALID OPTION'
      puts ''
      puts 'INVALID OPTION! PLEASE INPUT IN AN EMPTY CELL'
    else
      d_board.replace(position, token)
      checked = true
    end
    system 'clear'
    system 'cls'
    puts ''
  end

  if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(position.to_i)
    if turn.odd?
      puts "#{nickname1} placed #{token1} in slot #{position}"
    else
      puts "#{nickname2} placed #{token2} in slot #{position}"
    end
    puts ''
    puts d_board.display_boards
    puts ''
  elsif ![1, 2, 3, 4, 5, 6, 7, 8, 9].include?(position.to_i)
    puts 'INVALID INPUT TRY USING 1 TO 9'
    puts ''
  end

  if d_board.win? == true
    if turn.odd?
      puts "CONGRATULATIONS #{nickname1}! You won!!"
    else
      puts "CONGRATULATIONS #{nickname2}! You won!!"
    end
    on = false
  elsif turn == 9
    puts "GG WP #{nickname1} and #{nickname2}! YOU WENT TO A TIE!"
    on = false
  end

  turn += 1

end
