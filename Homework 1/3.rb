def combine_anagrams(words)
	result = {}
	words.each{ |w|
		k = w.downcase.split("").sort.join
		if result.has_key?(k) then
			result[k].insert(0,w)
		else
			result[k] = [w]
		end
	}
	return result.values
end

print combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )