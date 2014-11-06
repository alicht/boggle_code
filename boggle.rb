require 'pry'
	
		#      ["s", "n", "g", "i"],
        #      ["a", "t", "a", "c"],
        #      ["t", "r", "b", "g"],
        #      ["s", "a", "g", "i"]

class FindString

		attr_accessor :board, :string

	def initialize(string, board)
		@string = string
		@board = board
	end



	def letter_exists(board, letter)
		result = []
		board.each_with_index do |row, index|
			column = row.index(letter)
			if !column.nil?
				result << {x: index, y: column}
			else
				nil
			end
		end
			if result == []
		return nil
			else
		return result
		end
	end

	def connected_nodes?(first_letter, next_letter)
	  initial_letters = letter_exists(board, first_letter)
	  subsequent_letters = letter_exists(board, next_letter)
	  if initial_letters.nil?  || subsequent_letters.nil?
	    return false
	  end
		initial_letters.each do |i|
		subsequent_letters.each do |s|
			return true if connected_node?(i , s)
			end
		end
		return false
	end



	def connected_node?(initial_letter,subsequent_letter)
	  if initial_letter[:x].between?(subsequent_letter[:x]-1,subsequent_letter[:x]+1) && 
	  	initial_letter[:y].between?(subsequent_letter[:y]-1,subsequent_letter[:y]+1)
	    return true
		else
	  	return false
		end
	end

	def letter_exists?(board, letter)
    !letter_exists(board, letter).nil?
	end


	def word_exists
		word_length = string.length
		word_array = string.split("")
		word_array.each_with_index do |letter, index|
			if letter_exists?(board, letter)
				unless word_array[index + 1].nil?  
				return false unless connected_nodes?(letter, word_array[index + 1])  
			end
			else
				return false
			end
		end
	  return true 
	end
end

         board=     		[["s", "n", "g", "i"],
             				["a", "t", "a", "c"],
             				["t", "r", "b", "g"],
             				["s", "a", "g", "i"]]


word_one = FindString.new("starts", board)
p word_one.word_exists