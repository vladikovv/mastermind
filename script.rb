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
  code_letter_hash = code.each_char.tally
  guess_letter_hash = guess.each_char.tally
  #TODO: fix this mess

  print code_hash
end

def valid_guess?(guess)
  guess.length == 4
end

def print_dashes_and_sleep(seconds)
  print ("------------\n")
  sleep(seconds)
end

def print_instructions
  print("This game is called Cows and Bulls\n")
  sleep(2)
  print "You need to guess the exact code the computer has generated in 12 or less attempts!\n"
  sleep(3)
  print "After each guess you will get clues about the correctness of your guesses!\n"
  sleep(3)
  print("A bull means that you have correctly guessed both the number and its position in the code!\n")
  sleep(4)
  print("A cow means that you have correctly guessed the number but you've yet to figure out its correct position in the code\n")
  sleep(5)
  print("Well, let's begin :)\n")
end

def game
  # print_instructions
  # print_dashes_and_sleep(0.5)
  # print_dashes_and_sleep(0.5)
  # print_dashes_and_sleep(0.5)
  # print_dashes_and_sleep(2)

  secret_code = generate_code
  print "Secret code has been generated!\n\n"
  sleep(2)

  number_of_guesses_left = 12
  while number_of_guesses_left != 0
    print "code: #{secret_code}\n\n"
    print "You have #{number_of_guesses_left} guesses left decipher it or you lose!\n\n"
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
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(0.5)
    print_dashes_and_sleep(1)
    bulls_count = calculate_bulls(secret_code, guess)
    print "bulls: #{bulls_count}\n"
    cows_count = calculate_cows(secret_code, bulls_count, guess)
    print "cows: #{cows_count}\n\n"
    number_of_guesses_left -= 1

  end
  print "The code was #{secret_code}! ggwp"
end

game