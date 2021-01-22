require 'colorize'
require 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor([0, 0], board)
    end

    def render
        system("clear")

        letters = 'abcdefgh'
        puts "   #{letters.split('').join("  ")} "
        board.dup.each_with_index do |row, idx|
            puts "#{idx+1} " + row.join
        end
        puts "   #{letters.split('').join("  ")} "
    end

    private

    attr_reader :board

end