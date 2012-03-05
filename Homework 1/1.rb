def palindrome?(string)
	string.downcase!.gsub!(/\W/, '')
	return string == string.reverse
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
puts palindrome?("Racecar")
puts palindrome?("Do geese see God?")

def count_words(string)
  r = string.downcase.gsub(/[.,\-!]/,'').split()
  h = {}
  h.default=0
  r.each do |w|
  	h[w] += 1
  end
  return h
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words "Doo bee doo bee doo"