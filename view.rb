require_relative 'model'
require_relative 'controller'



EXIT_SENTINAL = "-1"
EXIT_MESSAGE = "Thanks for playing!"
SHOW_ANSWER = "show"
DEFINITION = 0
ANSWER = 1

our_model = Model.new
our_model.create_cards("flashcard_samples.txt")
our_deck = Deck.new(our_model.flashcards)

puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition."
puts "To Exit Type : -1"
puts "If you don't know enter \"show\" to get the answer"
puts "Ready?  Go!"

print "\n\nDescription : "

current_card = our_deck.draw_card
puts current_card[DEFINITION]


print "Can you guess the term? : "
input = gets.chomp

 until input == EXIT_SENTINAL

  until (input == current_card[ANSWER] || input == SHOW_ANSWER || input == EXIT_SENTINAL) # until the user gets the question right or gives up 
    print "Can you guess the term? : "
    input = gets.chomp
  end

  if input == SHOW_ANSWER
    puts current_card[ANSWER]
    our_deck.put_card_back(current_card)
    input = ""
  end

  if input == current_card[ANSWER]
    puts "You got it!"
  end

  if input == EXIT_SENTINAL
    break
  end

  current_card = our_deck.draw_card
  puts
  puts current_card[DEFINITION]
end

puts EXIT_MESSAGE
