# Name: Simple Secure Password Generator
# Description: Generate a secure password and string to remember it by
# Author: Thabo Titus
# ------------------------------------------------------------------------------

require 'securerandom'

NATO_ALPHABET = {
	a: "alfa",
	b: "bravo",
	c: "charlie",
	d: "delta",
	e: "echo",
	f: "foxtrot",
	g: "golf",
	h: "hotel",
	i: "india",
	j: "juliett",
	k: "kilo",
	l: "lima",
	m: "mike",
	n: "november",
	o: "oscar",
	p: "papa",
	q: "quebec",
	r: "romeo",
	s: "sierra",
	t: "tango",
	u: "uniform",
	v: "victor",
	w: "whiskey",
	x: "xray",
	y: "yankee",
	z: "zulu"
}

# Generate secure password
def generator(num)
	SecureRandom.base64(num)
end

def converter(complex_password)
	# Print out rememberable value
	complex_password.each_char do |val|
		val = val.downcase
		if has_key(val) then print_key_val(val) else print "#{ val } " end
	end
	# Print empty line
	print ""
end

# Print the correspinding value for the key
def print_key_val(the_val)
	print NATO_ALPHABET["#{ the_val }".to_sym].concat(" ")
end

# Check if NATO_ALPHABET cointains the key
def has_key(the_val)
	NATO_ALPHABET.keys.include? the_val.to_sym
end

def print_dash_lines
	60.times do print "=" end
		puts ""
end

# Output to the user
def output()
	# Variable to hold the password
	pass = generator(6)

	print_dash_lines
	
	puts "Your Secure Password:"
	puts pass

	print_dash_lines

	puts "Remember it by:"
	puts converter(pass)

	print_dash_lines
end

output


