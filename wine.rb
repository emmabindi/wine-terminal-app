require_relative "wine_classes"
require 'tty-prompt'
require 'csv'
require 'colorize'
require 'rubocop'

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
    puts ""
  end
  rescue 
    puts "Sorry, that didn't work, please enter your age in years using numbers only"
    retry
end

budget = prompt.select("Please confirm your budget for this wine selection:
  
  Budget >$25 | Mid-Range: $25-$50 |  Premium: >$50  
  
  ", 
  %w(Budget Mid-Range Premium))

begin

  raise "invalid input" if budget != "Budget" && budget != "Mid-Range" && budget != "Premium"
  rescue RuntimeError
      puts "Sorry, that didn't work, please chose either Budget, Mid-Range or Premium from the list of options"
      retry
  end
 
  # the below code begins to filter the wine selected by the user into a new array which will then be displayed to them. First filter is budget and then it moves onto type

  user_wine_selection = wine_list.select do |wine|
    budget == wine.budget
  end

  type_selected = prompt.select("Now that we've confirmed your price range. Please confirm your preference for wine today:
    ", 
    %w(Sparkling White Rose Orange Red Surprise))

puts ""

final_selection = user_wine_selection.select do | wine | 
  type_selected == wine.type
end

#the below code is to allow for conversational style printing of the wine suggestion

puts "This is the wine I will suggest today based on your budget and preferences: 

#{final_selection[0].name} by #{final_selection[0].producer} which retails for #{final_selection[0].sale_price}. 

This wine is from #{final_selection[0].region} in #{final_selection[0].country_of_origin} and is made from #{final_selection[0].grape_variety} grapes.

".colorize(:light_blue) 

# the blue code is to send the user back to the beginning of the process if they are not happy with the suggestion or changed their mind on budget

satisfied = prompt.select("Would you like to accept this suggestion or review the options again and make changes to your preferences? 
  ", ["I'm happy with my selection and would like to purchase this wine, cheers!", "I would like to review the options again"])

  raise "Ok we'll start again" if satisfied != "I'm happy with my selection and would like to purchase this wine, cheers!"
  rescue
    retry 
  else
    #The below code is me attempting to list the wine selected into a sales file recording prices
   
    CSV.open("./Wine-Sales.csv", "a") do |csv|
      csv << [[final_selection[0].name], [final_selection[0].sale_price]]
    end 
    exit
  end

  rubocop -a
 
    # csv_sales = File.read('Wine-Sales.csv')
    # csv = CSV.parse(csv_sales, :headers => true)
    # wine_sales = []

   # p csv.to_a.last
    
    
    
    # csv_sales = File.read('Wine-Sales.csv')
    # csv = CSV.parse(csv_sales, :headers => true)
    # wine_sales = []
    # csv.each do |row|
    #   row_data = row.to_hash
    #   # wine_sales.push([final_selection[0].name], ([final_selection[0].sale_price]))
    #   wine_sales.push(row_data["Name", row_data["Sale_Price"]])
    # end