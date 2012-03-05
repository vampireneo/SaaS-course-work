#(a) Create a class Dessert with getters and setters for name and calories.  Define 
#    instance methods healthy?, which returns true if a dessert has less than 200 
#    calories, and delicious?, which returns true for all desserts.
class Dessert
	def initialize(name, calories)
		@name=name
 		@calories=calories
	end
	def name
		@name
	end
	def name=(name)
		@name=name
	end
	def calories
		@calories
	end
	def calories=(calories)
		@calories=calories
	end
	def healthy?
		return @calories < 200
	end
	def delicious?
		return True
	end
end

#(b) Create a class JellyBean that extends Dessert, and add a getter and setter for 
#    flavor.  Modify delicious? to return false if the flavor is black licorice (but delicious? 
#    should still return true for all other flavors and for all non-JellyBean desserts).

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name,calories)
		@flavor=flavor
	end
	def flavor
		@flavor
	end
	def flavor=(flavor)
		@flavor=flavor
	end
	def delicious?
		return (flavor!="black licorice")
	end
end

d = Dessert.new("abc", 100)
puts d.healthy?

b = JellyBean.new("def", 400, "black licorice")
puts b.delicious?

a = JellyBean.new("xyz", 300, "e")
puts a.delicious?
