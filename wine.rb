require_relative "wine_classes"
require 'tty-prompt'
require 'csv'

prompt = TTY::Prompt.new

puts "Hello and welcome to Em's Wine Selection Assistant"
puts "Please input your age in years"

age = gets.chomp.to_i

if age < 18 
  puts "Sorry, you need to be over 18 to use this application"
  exit
else 
 puts "Thanks, let's continue"



#  Asking question with list of options couldn't be easier using select like so:

# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))# =>
# # Choose your destiny? (Use ↑/↓ arrow keys, press Enter to select)
# # ‣ Scorpion
# #   Kano
# #   Jax


budget = prompt.select("Please confirm your budget for this wine selection:", %w(Budget Mid-Range Premium))

 begin
#   puts "Please confirm your budget for this wine selection:
#   1. Budget (<$25)
#   2. Mid-Range ($25 - $50)
#   3. Premium (>$50)"

  # budget = gets.chomp.to_i

  raise "invalid input" if budget != "Budget" && budget != "Mid-Range" && budget != "Premium"
  rescue RuntimeError
      puts "Sorry, that didn't work, please chose either Budget, Mid-Range or Premium from the list of options"
      retry
  end
end
#  case budget 

#  when 1 
#   budget == Budget
#   puts "No problems. We can find something budget for you."
#  when 2
#   budget == Mid-Range
#   puts "No problems, you're looking for a mid-range bottle"
#  when 3
#   budget == Premium
#   puts "Ooh you're fancy"
#  else 
#   puts "Sorry, that input wasn't correct, please try again and enter 1, 2 or 3"
#  end


puts ""
puts "Now that we've confirmed your price range. 
Please confirm your preference for wine today..
Sparkling, White, Rose, Orange or Red"

puts ""
type_selection = gets.chomp.capitalize!
puts ""

# def which_type
#   if @type.include? "Orange"
#     puts "You chose Orange"
#   else
#   end
# end

# which_type


csv_text = File.read('Wine-List-March2020.csv')
csv = CSV.parse(csv_text, :headers => true)
# wine_selected = []
csv.each do |row|
  row_data = row.to_hash
  if (row_data['Type'] == type_selection) && (row_data['Budget'] == budget)
    puts row_data
    # wine_selected << row_data
  end 
end

puts csv