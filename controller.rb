class Deck
  attr_accessor :deck
  def initialize(flashcards)
    @deck = flashcards.shuffle!
  end 

  def shuffle!
    @deck.shuffle!
  end

  def draw_card()
    @deck.shift(1).flatten
  end

  def put_card_back(flashcard)
    @deck << flashcard
  end
end
