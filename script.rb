def generate_code
  result = String.new
  4.times do
    result.concat(rand(6).to_s)
  end
  result
end

print generate_code