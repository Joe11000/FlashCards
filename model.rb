class Model
  attr_accessor :flashcards
  def initialize
    @flashcards = []
  end
  
  def create_cards(file)
    #open file and load data
    #return nested array which is going to be a deck of flashcards aka nested array 
    line_counter = 0
    File.readlines(file).each do |line|
      if line_counter % 3 != 2 # if definition or term
          @flashcards << [] if line_counter % 3 == 0    # push a new flashcard location onto flashcard array
          @flashcards[line_counter/3][line_counter%3] = line.chomp # add the definition or the term to the last card on the flashcard array
      end
      line_counter += 1                           # keep track of (current line - 1)
    end
  end

  def save_current_deck_to_file(current_deck)
      # save into file
  end
end
