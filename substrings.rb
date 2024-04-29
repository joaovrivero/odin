def substrings(word, dictionary)
  word.downcase!
  result = Hash.new(0)

  dictionary.each do |substring|
    count = word.scan(/#{substring.downcase}/).length
    result[substring] += count if count > 0
  end

  result
end

word = "Howdy partner, sit down! how's it going?"
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings(word, dictionary)
