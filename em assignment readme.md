### Link to Source Code Repository:

#### https://github.com/emmabindi/wine-terminal-app.git

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

1. Age Filter. The application will utilise logic to provide control flow based on the condition of the user being under or of a legal drinking age in Australia. This feature should allow a retry attempt if user inputs data other than an integer.

2. Budget Filter. The application will provide a selection of budget ranges for the user to choose from. This filter will then only suggest wine bottles to purchase if they fall within the user's budget. If user input does not match the budget options presented, an notification will present to let the user know they need to start the selection process from the beginning. And/or TTY-prompt gem will be utilised to ensure user can only select from the available options and no input errors occur.

3. Wine Preference. The application will take input from the user on which wine category they would like to select from. The application will present a list of categories available to choose from: Sparkling, White, Rose, Orange, Red and Surprise and following on from the user's choice of one of these categories will then present wine bottles available which fall into this category only.   
If user input does not match the categories  presented, an notification will present to let the user know they need to start the selection process from the beginning. And/or TTY-prompt gem will be utilised to ensure user can only select from the available options and no input errors occur.

4. Wine Suggestion List. Following on from obtaining the user's inputs of age, budget and preference, the application will then provide a list for the user to view of the suitable wine offerings available with additional information such as producers name, the country of origin, region, grape variety and sale price. The suggestion list will be colored in blue so it stands out.

5. Wine Selection. The application will then accept a decision from the user to choose a particular bottle from the suggested list. It will also allow the user to reject the offered wines and re-start the selection process if user changes their mind or are unhappy with the suggestion. 

6. Wine Sales Log. The application will have an in built function to output the user selections to a csv file which will record the wines selected and sales price. This output will continuously add the user selections and create a log of sales.  


--- 

### User Interaction and Experience 


The user will interact with this application by running the ruby program from their terminal. From the initialisation of the app, the terminal window will display prompts and menu options to the user. 

These prompts and messages will direct and guide the user through the application so that the features are accessed/utilised. 

Using the TTY-prompt gem will reduce the likelihood of user input created errors by limiting and controlling user inputs to selections from a pre-defined menu only. 

---   


### Control Flow Diagram

![Emma's_Control_Flow_Diagram_Terminal_App](https://www.lucidchart.com/documents/edit/34498ea0-da9c-49ab-8f78-f09da296a6f8/OdhJVqF-g3cm?beaconFlowId=299422ED2D24C98A
https://pdf-service-lucidchart-com.s3.amazonaws.com/88ca132d-8a27-495c-b361-8437de616185?X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLWVhc3QtMSJHMEUCIQD3DNoX5LUEMaIqA79M%2BoDx8uVCOAE0QE6ztdDA2OjSHwIgCeR3xzl2DBLI4WW3y8SKEg8JFpX6Yb79U1cWmDeckd8qvQMI%2FP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw5MzU2MDY5MjYxODIiDMl5t%2Fd8nfp7UUvDoiqRAyzk%2FqvuGLvtyyjwau%2FHaWScurK%2BS6jGBxAfzP%2Bf7Aj5gcqH2%2FdqPil%2F5Oozx90DeowygBiicm4DrkSGmRjV0JQT4bKRjpMle5%2F9ryd15dz3ugrYA4ZlxD7R6wnJuv8d1GpVTzLjeVgYTcaRJ%2B7J6PIQkQZ%2F7T0zsRMLMfZaJY3%2Bh28109CQZkBRnqHAC%2Bu3n2pKNvbWbupuzw8GrhRVslUjDLhNmrTndWfE9piU9HAsPjviWnJu7C%2B4ZBitH59lPp6qyXYEw9%2BTY%2F%2F7RhfQgQ83Nj3gIH%2BiXM1Yn4W4CAm7kkBIQyPznEQwaGVLk6zQnapzwjDlbx2U3d3wtB%2Bpd2Fw5gdgE1JgfL%2F10vQ%2FIoVjvQNB8KtIjpk00mlzSK1Bkiac2wDFNMZA3TFZYOeu3fRWoXS9KJ5GbWWkIKhvIdFRf0q%2By7F9ZlX00hAF81Rb6VxF6uYSUSbh1sxHfPz018TVhHDl6MPedv3N6EMBP%2Fj8K1bW%2BkJkG2blS8daGv8HluaKkQtXVXFNCHYob4WyMI6gMLWpofMFOusBWHNIr1aC8u3NLeFy816cHcDfz2z6ZEOnFQU8E6VEzLvyQX6bfmUXUBlsPDUWnlEvl8pcdzEnULrluo2gKNFw1I2jKdmjTflhwBtSRK0fsejCkAF1ZaVbKupKurKy6YW40FW8OjaVFvthUdFStaiFBy3ptw%2BPww6UwTwtYZT7A6cg5os7%2FdYL3T88iiOkZnd%2FqYk63qMPqPc4cNMCsC1NE9xFmKuwh0mMJ57G4WmkRh8snKg045lva%2BjG%2B%2FUUaxjp2DE8ZNCuH8XmXJwjF1gxq5zREkcmcTvilehds786tcgfVpEXfDQw9jW5xw%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20200311T035444Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=ASIA5TVUEXNTGSMUGKVH%2F20200311%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=667d69320d18d521a147fc08a1f5d07fb4107ad9c649dcaf113436e6b70fdaa3)

--- 

### Implementation Plan 

For this application I utilised Trello project management software. 
The link to access my Trello board "FastTrack Terminal" is below:

https://trello.com/invite/b/rYZ1aRYW/8158415533b26771d5aca5b295ca5421/fasttrack-terminal 

*The general / overarching priority ranking that I followed was:*

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
- perform testing of all functions and implement handling techniques 

--- 

## HELP Documentation 

### Installation Instructions


### Dependencies 


### System/Hardware Requirements


### How to use the application
