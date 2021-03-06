require_relative "bingo/board"
require_relative "bingo/square"

module Bingo
  NUMBERS = [0,56,39,4,52,7,73,57,65,13,3,72,69,96,18,9,49,83,24,31,12,64,29,21,80,71,66,95,2,62,68,46,11,33,74,88,17,15,5,6,98,30,51,78,76,75,28,53,87,48,20,22,55,86,82,90,47,19,25,1,27,60,94,38,97,58,70,10,43,40,89,26,34,32,23,45,50,91,61,44,35,85,63,16,99,92,8,36,81,84,79,37,93,67,59,54,41,77,42,14].freeze

  def self.find_winning_score(boards)
    NUMBERS.each do |number|
      boards.each do |board|
        board.mark(number)
        return board.score(number) if board.winning?
      end
    end

    nil
  end

  def self.find_losing_score(boards)
    losing_board = nil
    NUMBERS.each do |number|
      boards.each do |board|
        board.mark(number)
      end

      losing_boards = boards.reject(&:winning?)
      if losing_boards.length == 1 && losing_board.nil?
        losing_board = losing_boards.first
      elsif losing_boards.empty?
        losing_board.mark(number)
        return losing_board.score(number)
      end
    end

    nil
  end
end
