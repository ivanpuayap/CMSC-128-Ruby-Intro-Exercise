#Part 1

def sum(array)
	ret = 0;
	array.each{ |x|
		ret = ret + x
	}
	ret
end

def max_2_sum(array)
	ret = 0
	max1 = 0
	max2 = 0
	if array.length == 0
		ret = 0
	elsif array.length == 1
		ret = array[0]
	else
		max1 = array[0]
		for i in 1...array.length
			if max1 < array[i]
				max1 = array[i]
			end
		end
		
		array.delete_at array.index max1
		
		max2 = array[0]
		for i in 1...array.length
			if max2 < array[i]
				max2 = array[i]
			end
		end
		ret = max1+max2
	end
	ret
end

def sum_to_n?(array, n)
	ret = false
	for i in 0...array.length
		for j in 0...array.length
			if array[i]+array[j]==n && i != j
				ret = true
			end
		end
	end
	ret
end

# Part 2

def hello(name)
	"Hello, #{name}"
end

def starts_with_consonant? s
	s.upcase!
  	ret = false
	"BCDFGHJKLMNPQRSTVWXYZ".split("").each{ |l|
		if s.start_with?(l) then
			ret = true
		end
	}
	ret
end

def binary_multiple_of_4?(s)
	ret = false
	is_binary = true
	s.split("").each{ |x|
		is_binary = false unless x == "0" || x == "1"
	}
	
	if is_binary && s.length!=0
		integer = s.to_i
		
		if integer%4==0
			ret = true
		end
	end
	
	ret
end

class BookInStock
	def initialize(isbn, price)
		unless price > 0
			raise ArgumentError.new "Price cannot be zero or a negative number"
		end
		@price = price
		
		unless isbn.length == 0
			raise ArgumentError.new "Invalid ISBN"
		end
		
		@isbn = isbn
	end
	
	attr_accessor(:isbn, :price)
	
	def price_as_string
		ret = "$"
		temp = price*10
		temp2 = price*100
		if price % 1 == 0
			ret = ret + price.to_s + ".00"
		elsif temp % 1 == 0
			ret = ret +price.to_s+ "0"
		elsif temp2 % 1 != 0
			temp3 = temp2 - (temp2%1)
			temp3 = temp3/100
			ret = ret+ temp3.to_s
		else
			ret = ret+price
		end
		ret
	end
end