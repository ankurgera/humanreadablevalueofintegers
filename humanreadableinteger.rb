NUM_0_TO_19 = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", 
"Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", 
"Seventeen", "Eighteen", "Nineteen"]

NUM_20_TO_90 = ["Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", 
"Ninety"]

SIZE_TO_NUM = {3 => [2, "Hundred"], 4 => [3, "Thousand"], 5 => [3, "Thousand"],
6 => [3, "Thousand"], 7 => [6, "Million"], 8 => [6, "Million"], 9 => [6, "Million"], 
10 => [9, "Billion"], 11 => [9, "Billion"], 12 => [9, "Billion"]}

def num_bet_0_to_19(number)
  NUM_0_TO_19[number]
end

def num_bet_20_to_99(number)
  "#{NUM_20_TO_90[(number/10) -2]} #{NUM_0_TO_19[number%10]}".strip
end

def num_greater_than_100(number)
  num_length = number.to_s.length
  power_map = SIZE_TO_NUM[num_length]
  power = power_map.first
  first_part = "#{readable_value_of(number/(10**power))}".strip
  middle_part = power_map.last
  last_part = "#{readable_value_of(number%(10**power))}".strip
  "#{first_part} #{middle_part} #{last_part} "
end

def readable_value_of(number)
  case number
  when 0..19
    num_bet_0_to_19(number)
  when 20..99
    num_bet_20_to_99(number)
  when 100..2000000000
    num_greater_than_100(number)
  else
    "Error: Invalid input number: #{number}."
  end
end

def human_readable_value_of(number)
  return NUM_0_TO_19.first if number == 0
  return "Negative #{readable_value_of(number*-1)}" if number < 0
  readable_value_of(number)
end

puts human_readable_value_of(0)
puts human_readable_value_of(-17)
puts human_readable_value_of(1000018)
puts human_readable_value_of(123456789)
