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
  4.times do |i|
    result += 1 if code.include?(guess[i])
  end
  result - bulls_count
end

def valid_guess?(guess)
  guess.length == 4
end

def game
  secret_code = generate_code
  print "code: #{secret_code}\n"

  number_of_guesses_left = 12
  while number_of_guesses_left != 0
    print "#{number_of_guesses_left} guesses left!\n"
    print 'guess the sequence: '
    guess = gets.chomp
    until valid_guess?(guess)
      print "You need to enter a 4 digit sequence (1 to 6)\n"
      print 'Try again: '

      guess = gets.chomp
    end
    bulls_count = calculate_bulls(secret_code, guess)
    print "bulls: #{bulls_count}\n"
    cows_count = calculate_cows(secret_code, bulls_count, guess)
    print "cows: #{cows_count}\n"
    number_of_guesses_left -= 1
  end
end

game