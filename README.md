### Link to Source Code Repository:

 https://github.com/emmabindi/wine-terminal-app.git

--- 

# Software Development Plan

## *Purpose*

"Em's Wine Selection Assistant" is a terminal app design to assist user's with the decision making process of identifying and selecting a bottle of wine to purchase from the list of available options, within their budget and according to their preference.

This app is designed to increase efficiency in decision making by filtering the available wine bottles to a suitable selection for the user. The app is also designed to ensure only users of a legal drinking age can participate.

The target audience for this app is wine lovers who are of a legal drinking age in Australia. 

A member of the target audience will use it by installing the required gems and running the ruby file. 
The user will then interact with the application by inputting their selections upon command into the terminal and following prompts.    
    
 --- 

## *Features*

**1. Age Filter**  

The application will utilise logic to provide control flow based on the condition of the user being of a legal drinking age in Australia. This feature should allow a retry attempt if user inputs data other than an integer.
This feature will also present a sorry message and exit to the users under the legal drinking age. As well as present a sorry message and exit for users over a reasonable age for consuming alcohol such as 140 years of age.

**2. Budget Filter**  

The application will provide a selection of budget ranges for the user to choose from. This filter will then only suggest wine bottles to purchase if they fall within the user's budget. If user input does not match the budget options presented, a notification will display to let the user know they need to start the selection process from the beginning. 
And/or TTY-prompt gem will be utilised to ensure user can only select from the available options and no input errors occur.

**3. Wine Preference**  

The application will take input from the user on which wine category they would like to select from. The application will present a list of categories available to choose from: Sparkling, White, Rose, Orange, Red and Surprise and following on from the user's choice of one of these categories will then present wine bottles available which fall into this category only.   
If user input does not match the categories  presented, an notification will present to let the user know they need to start the selection process from the beginning. And/or TTY-prompt gem will be utilised to ensure user can only select from the available options and no input errors occur.   

**4.  Wine Suggestion List**  

Following on from obtaining the user's inputs of age, budget and preference, the application will then provide a list for the user to view of the suitable wine offerings available with additional information such as producers name, the country of origin, region, grape variety and sale price. The suggestion list will be colored in blue so it stands out.

**5. Wine Selection**  

The application will then accept a decision from the user to choose a particular bottle from the suggested list. 
It will also allow the user to reject the offered wines and re-start the selection process if user changes their mind or are unhappy with the suggestion. 

**6. Wine Sales Log**  

The application will have an in built function to output the user selections to a csv file which will record the wines selected and sales price. This output will continuously add the user selections and create a log of sales so that dollar totals can be calculated and used.  


--- 

### User Interaction and Experience 


The user will interact with this application by running the ruby program from their terminal. From the initialisation of the app, the terminal window will display prompts and menu options to the user. 

These prompts and messages will direct and guide the user through the application so that the features are accessed/utilised. 

Using the TTY-prompt gem will reduce the likelihood of user input created errors by limiting and controlling user inputs to selections from a pre-defined menu only. The use of the gem TTY prompt allowed me to remove the manual error handling code such as converting strings to integers, capitalising input to match menu options etc. 

---   


### Control Flow Diagram


![Control Flow Diagram - Wine Selection App](docs/Wine_Selection_App_Activity_Diagram.png)

--- 

### Implementation Plan 

For this application I utilised Trello project management software. 
The link to access my Trello board "FastTrack Terminal" is below:

https://trello.com/invite/b/rYZ1aRYW/8158415533b26771d5aca5b295ca5421/fasttrack-terminal 

Snapshots of Trello Board in Progress:

![Trello Board Photo 1](docs/Trello-snippet1.png)
![Trellot Board Photo 2](docs/Trello-snippet2.png)

**The general / overarching priority ranking that I followed was:**

High Priority: 
 - create or locate data set of wine data for selection
 - create class for Wine 
 - create objects for wines in my data set ("wine list")
 - create display with welcome message
 - create function to obtain users age. Control flow based on age parameters 
 - testing and implement error handling for age function 

Medium Priority/or Dependant Tasks:
- create function to display budget options and obtain user selection
- testing and implement error handling for budget selection 
- ensure budget selection creates a new array with the wines within the budget parameters only
- create function to display wine type options and obtain user selection
- testing and implement error handling for wine type selection 
- display the suggested wine to the user based on budget and type 
- make the above display user friendly and conversational 
- present option to user to accept the suggested wine or reject it and restart the process 
- test the accept/reject wine suggestion function  
- create csv file to record sales log with wine name and price
- read csv file and push selected wine to the file
- test wine sales csv document push and ensure selections are appended to existing data not overwriting so a sales log/history is developed providing $ totals 

Low Priority / Final Tasks
- add artwork, font and colours to the menu options and text displays to make the interaction with teriminal more fun 
- add methods to run greeting/messages in artistic formats
- perform testing of all functions and implement error handling techniques 

--- 

## HELP Documentation 

### Installation Instructions

**1. Install ruby**

Mac OS:  
Recommend to utilise package manager called "Homebrew" 

Run the following command in terminal: 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Then utilise the version manager rbenv to install Ruby:

Run the following commnand in terminal: 

``` 
brew install rbenv
```

Set up rbenv in your shell by running the following command and following the printed instructions

``` 
rbenv init 
```

Close terminal window and re-open for changes to take effect.

Run the following command in terminal: 

```
rbenv install 2.7.0
```  

*(For non-Mac users, please Google for 'how-to' instructions or preferably utilise a virtual machine)*

**2. Install gem**

Run the following command in terminal: 

```
gem install wine-terminal-app
```

**3. Type irb into terminal**

``` 
irb 
```

**4. Require the gem in terminal and run** 

``` 
require 'wine-terminal-app'
```

--- 

### Dependencies 

This application has the below dependencies which are already within the gem file: 

- colorize 
- TTY-prompt 
- artii 
- rubocop


--- 

### System/Hardware Requirements

There are no specific hardware requirements to run the gem.

--- 

### Instructions: How To Use the Application

To run this wine selection assistant:

1. open the terminal window on your computer.
2. enter "ruby wine.rb" into your terminal 
3. from this point, a welcome message will appear and the application will begin to guide you through the selection process
4. follow the prompts and enter your age in years (full numbers only ie. 27 if you are 27 years old)
5. if you are over 18 years old, a menu will appear offering you budget levels to choose from. Use the arrow up and down keys on your keyboard to make your selection and then press enter
6. another menu and message will appear offering you the choice of which type of wine you would like suggested to you. Use the up and down arrow keys to make your selection and then press enter. If you would like the computer to 'surprise' you choose "surprise" instead.
7. the application will then display a wine to you within the parameters you had chosen in prior steps. Review this wine recommendation. 
8. another menu will appear, using the up and down arrow keys, select whether you are happy with the suggested wine or if you would like to restart the process. If you would like to restart the above steps will be carried out again.
9.  Once you select 'happy with the choice', a goodbye message will be received and the application will record the wine sale in an external csv file. 
10. Enjoy!