def generate_code
  result = String.new
  4.times do
    result.concat(rand(6).to_s)
  end
  result
end

def calculate_bulls(code, guess)
  result = 0
  4.times do |i|
    result += 1 if guess[i] == code[i]
  end
  result
end

def calculate_cows(code, bulls_count, guess)
  result = 0
  code_hash = code.each_char.tally
  guess_hash = guess.each_char.tally

  code_hash.each do |k1, v1|
    guess_hash.each do |k2, v2|
      if k1 == k2
        result += [v1, v2].min
      end
    end
  end

  result - bulls_count
end

def valid_guess?(guess)
  guess.length == 4
end

def print_dashes_and_sleep(seconds)
  print("\n")
  sleep(seconds)
end

def print_instructions
  print("INSTRUCTIONS:\n")
  sleep(2)
  print "You need to guess the exact code the computer has generated in 12 or less attempts!\n\n"
  sleep(3)
  print "The code is 4 digits long and each digit is between 0 and 6.\n\n"
  sleep(3)
  print "The digits can be repeated!\n\n"
  sleep(2)
  print "After each guess you will get clues about the correctness of your guesses!\n\n"
  sleep(3)
  print("A bull means you have correctly guessed both the number and its position in the code!\n\n")
  sleep(4)
  print("A cow means you have correctly guessed the number but you've yet to figure out its correct position in the code\n\n")
  sleep(5)

end

def play
  print("Well, let's begin :)\n")
  secret_code = generate_code
  print "Secret code has been generated!\n\n"
  sleep(2)

  number_of_guesses_left = 12

  while number_of_guesses_left != 0
    print "You have #{number_of_guesses_left} guesses left to decipher it or you lose!\n\n"
    sleep(2)
    print 'Enter your guess: '
    guess = gets.chomp
    until valid_guess?(guess)
      sleep(1)
      print "You need to enter a 4 digit sequence (1 to 6)!\n"
      print 'Try again: '
      guess = gets.chomp
    end
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(1)
    print "\n"
    bulls_count = calculate_bulls(secret_code, guess)
    if bulls_count == 4
      print "YOU GUESSED IT! CONGRATS! \n\n"
      print "Going to main menu!\n"
      sleep(2)
      game
    end
    print "Bulls: #{bulls_count}\n"
    cows_count = calculate_cows(secret_code, bulls_count, guess)
    print "Cows: #{cows_count}\n\n"
    number_of_guesses_left -= 1
  end
  print "You sadly lost((\n"
  print "The code was #{secret_code}! Nice try..\n\n"
  sleep(5)

  print "Going to main menu .....\n"
  sleep(2)

  game
end

def game
  print("\n\n")
  print("COWS AND BULLS\n\n")
  sleep(2)
  print("Input 'play' to start a game!\n")
  sleep(1)
  print("Input 'help' to see the game's instructions!\n")
  sleep(1)
  print("Input 'quit' to quit (obviously)\n\n")
  sleep(1)
  print('Your input: ')

  command = gets.chomp
  while command != 'play' && command != 'help' && command != 'quit'
    print('Your input: ')
    command = gets.chomp
  end

  case command
  when 'play'
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(2)
    play
  when 'help'
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(2)
    print_instructions
    game
  when 'quit'
    exit
  end
end

game