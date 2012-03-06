=begin
a) [ELLS ex. 3.11] Extend the currency-conversion example from lecture so that you can write
   5.dollars.in(:euros)
   10.euros.in(:rupees)
   etc.

   ● You should support the currencies 'dollars', 'euros', 'rupees' , 'yen' where the
     conversions are: rupees to dollars, multiply by 0.019; yen to dollars, multiply by 0.013;
     euro to dollars, multiply by 1.292.
   ● Both the singular and plural forms of each currency should be acceptable, e.g.
     1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.

   You can use the code shown in lecture as a starting point if you wish; it is at http://pastebin.com/agjb5qBF
=end

# metaprogramming to the rescue!

class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '').chomp('s')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
			super
		end
	end

	def in(currency)
		raise 'Param should be a symbol' unless currency.kind_of? Symbol
		singular_currency = currency.to_s.chomp('s')
		self / @@currencies[singular_currency]
	end
end

puts 5.dollars.in(:euros)
puts 10.euros.in(:rupees)

=begin
b) Adapt your solution from HW 1 "palindromes" question so that instead of writing palindrome?
   ("foo") you can write "foo".palindrome? HINT: this should require fewer than 5 lines of code.
=end
class String
	def method_missing(method_id)
		if method_id.to_s == "palindrome?" then
			s = self.downcase.gsub(/\W/, '')
			return s == s.reverse
		else
			super
		end
	end
end
puts "foo".palindrome?
puts "fof".palindrome?

=begin
c) Adapt your palindrome solution so that it works on Enumerables. That is:
   [1,2,3,2,1].palindrome? # => true
   (It's not necessary for the collection's elements to be palindromes themselves--only that the
   top-level collection be a palindrome.) HINT: this should require fewer than 5 lines of code.
   Although hashes are considered Enumerables, your solution does not need to make sense for
   hashes (though it should not error).
=end

module Enumerable
	def method_missing(method_id)
		if method_id.to_s == "palindrome?" then
			if self.kind_of? Array then
				self == self.reverse
			else
				self.to_a.palindrome?
			end
		else
			super
		end
	end
end

puts ["a", "b", "c", "b", "a"].palindrome? == true
puts [1,2,3,4,3,2].palindrome? == false
puts pvalue = {"hello"=> "world"}.palindrome?
puts (1..2).palindrome?