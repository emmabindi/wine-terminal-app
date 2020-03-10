require_relative "wine_classes"

puts "Hello and welcome to Em's Wine Selection Assistant"
puts "Please input your age in years"

age = gets.chomp.to_i

if age < 18 
  puts "Sorry, you need to be over 18 to use this application"
  exit
else 
 puts "Thanks, let's continue"
 puts "Please confirm your budget for this wine selection:
 1. Budget ($15 - $25)
 2. Mid-Range ($25 - $50)
 3. Premium (>$50)"

 budget = gets.chomp.to_i

 case budget 

 when 1 
  budget == 1
  puts "You're looking for budget"
 when 2
  budget == 2
  puts "You're looking for mid-Range"
 when 3
  budget == 3
  puts "You're fancy"
 else 
  puts "Sorry, that input wasn't correct, please try again and enter 1, 2 or 3"
# HOW DO I NOW GET BACK TO THE START TO RETRY BUDGET
 end
end



puts "Now that we've confirmed your price range. 
Please confirm your preference for wine today..
Sparkling, White, Rose, Orange or Red"


@type = gets.chomp.capitalize!

def which_type
  if @type.include? "Orange"
    puts "You chose Orange"
  else
  end
end

which_type
