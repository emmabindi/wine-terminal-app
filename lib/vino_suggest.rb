require "vino_suggest/version"

# module VinoSuggest
#   class Error < StandardError; end

require_relative 'wine_classes'
require 'tty-prompt'
require 'csv'
require 'colorize'
require 'artii'
require 'terminal-table'

def save_purchase_details(final_selection)
  CSV.open('./Wine-Sales.csv', 'a') do |csv|
    csv << [[final_selection[0].name, final_selection[0].sale_price]]
  end
end

def print_heading(message)
  a = Artii::Base.new font: 'digital'
  puts a.asciify(message).colorize(:light_blue)
end

prompt = TTY::Prompt.new

csv_text = File.read('Wine-List-March2020.csv')
csv = CSV.parse(csv_text, headers: true)
wine_list = []
csv.each do |row|
  row_data = row.to_hash
  wine_list.push(Wine.new(row_data['Type'], row_data['Name'], row_data['Budget'], row_data['Sale_Price'], row_data['Producer'], row_data['Country_of_Origin'], row_data['Grape_Variety'], row_data['Region']))
end

# The below code is to collect the user's age and verify that they are over 18 years old and legally allowed to consume alcohol (within Australia)

begin
    begin
      print_heading('Hello')

      puts "
  ... and welcome to Em's Wine Selection Assistant
  "
      puts 'Please input your age in years'

      age = gets.chomp
      age = Integer(age)

      if age < 18
        puts 'Sorry, you need to be over 18 to use this application'
        exit
      elsif age >=110
        puts 'Sorry, I appreciate your interest, but maybe considering your elderly age it would be best if you avoid alcohol in the best interests of your health'
        exit
      elsif age >= 18
        puts "Thanks, let's continue"
        puts ''
      end
    rescue StandardError
      puts "Sorry, that didn't work, please enter your age in years using numbers only"
      retry
    end
  
    # the below code is to collect the users budget selection 

    budget = prompt.select("Please confirm your budget for this wine selection:

  Budget >$25 | Mid-Range: $25-$50 |  Premium: >$50

  ",
                           %w[Budget Mid-Range Premium])

    begin
        if budget != 'Budget' && budget != 'Mid-Range' && budget != 'Premium'
          raise 'invalid input'
    end
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
                                  %w[Sparkling White Rose Orange Red Surprise])

    puts ''

    final_selection = user_wine_selection.select do |wine|
      type_selected == wine.type
    end

    # the below code is to allow for conversational style printing of the wine suggestion

    puts "This is the wine I will suggest today based on your budget and preferences:

#{final_selection[0].name} by #{final_selection[0].producer} which retails for #{final_selection[0].sale_price}.

This wine is from #{final_selection[0].region} in #{final_selection[0].country_of_origin} and is made from #{final_selection[0].grape_variety} grapes.
".colorize(:light_blue)

    # the below code is to send the user back to the beginning of the process if they are not happy with the suggestion or changed their mind on budget/type

    satisfied = prompt.select("Would you like to accept this suggestion or review the options again and make changes to your preferences?
  ", ["I'm happy with my selection and would like to purchase this wine, cheers!", 'I would like to review the options again'])

    if satisfied != "I'm happy with my selection and would like to purchase this wine, cheers!"
      raise "Ok we'll start again"
  end
rescue StandardError
  retry
else
  # The below code is me attempting to list the wine selected into a sales file recording prices
  puts "
    Thank you - enjoy your bottle of vino!
    "

  print_heading('Cheers!  Salute!  Prost!')
  puts ""
 
  save_purchase_details(final_selection)
  exit
  end
# end