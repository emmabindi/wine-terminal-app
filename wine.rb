require_relative "wine_classes"
require 'tty-prompt'
require 'csv'

prompt = TTY::Prompt.new

csv_text = File.read('Wine-List-March2020.csv')
csv = CSV.parse(csv_text, :headers => true)
wine_list = []
csv.each do |row|
  row_data = row.to_hash
  wine_list.push(Wine.new(row_data["Type"], row_data["Name"], row_data["Budget"], row_data["Sale_Price"], row_data["Producer"], row_data["Country_of_Origin"], row_data["Grape_Variety"], row_data["Region"]))
end

#The below code is to collect the user's age and verify that they are over 18 years old and legally allowed to consume alcohol (within Australia)
  
begin 
  
  puts "Hello and welcome to Em's Wine Selection Assistant"
  puts "Please input your age in years"

  age = gets.chomp
  age = Integer(age)
  
  if age < 18 
    puts "Sorry, you need to be over 18 to use this application"
    exit
  elsif age >= 18 
    puts "Thanks, let's continue"
  end
  rescue 
    puts "Sorry, that didn't work, please enter your age in years using numbers only"
    retry
end

budget = prompt.select("Please confirm your budget for this wine selection:", %w(Budget Mid-Range Premium))

begin

  raise "invalid input" if budget != "Budget" && budget != "Mid-Range" && budget != "Premium"
  rescue RuntimeError
      puts "Sorry, that didn't work, please chose either Budget, Mid-Range or Premium from the list of options"
      retry
  end
 
  # the below code begins to filter the wine selected by the user into a new array which will then be displayed to them. First filter is budget and then type

  user_wine_selection = wine_list.select do |wine|
    budget == wine.budget
  end

  # pp  user_wine_selection #this line prints out the new array of filtered wines

puts ""
puts "Now that we've confirmed your price range. 
Please confirm your preference for wine today..
Sparkling, White, Rose, Orange or Red"

puts ""
type_selected = gets.chomp.capitalize!
puts ""

user_wine_selection_budget_filtered = user_wine_selection.select do | wine | 
  type_selected == wine.type
end

puts "This is the wine I will suggest today based on your budget and type preference:"
p user_wine_selection_budget_filtered












# def which_type
#   if @type.include? "Orange"
#     puts "You chose Orange"
#   else
#   end
# end

# which_type


