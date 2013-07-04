constants = {
	'1' => 'I',
	'5' => 'V',
	'10' => 'X',
	'50' => 'L',
	'100' => 'C',
	'500' => 'D',
	'1000' => 'M'
}

puts "Enter a number"
n = gets.chomp

roman_num = ""
index = 10**(n.length - 1)

n.split('').each do |s|
	digit = s.to_i
	if [1, 2, 3].include? digit
		digit.times { |x| roman_num += constants[(index).to_s] }
	elsif [6, 7, 8].include? digit
		roman_num += constants[(5 * index).to_s]
		(digit - 5).times { |x| roman_num += constants[(index).to_s] }
	elsif [4, 9].include? digit
		roman_num += constants[index.to_s] + constants[((digit + 1) * index).to_s]
	elsif digit == 5
		roman_num += constants[(5 * index).to_s]
	end
	index /= 10
end

puts "#{n} in Roman numerals is #{roman_num}"