

Readme file

github repo

software development plan

** Develop** a statement of **purpose** and **scope** for your application. It must include: 

- **describe** at a high level what the application will do

- **identify** the problem it will solve and **explain** why you are developing it 
-  **identify** the target audience - **explain** how a member of the target audience will use it

Develop a list of features:

- at least THREE **features**
- *describe** each feature

**Note:** **Ensure** that your features above allow you to demonstrate your understanding of the following language elements and concepts:
\- use of variables and the concept of variable scope
\- loops and conditional control structures
\- error handling

**Develop** an **outline** of the user interaction and experience for the application.
Your outline must include:
\- how the user will find out how to interact with / use each feature
\- how the user will interact with / use each feature
\- how errors will be handled by the application and displayed to the user

trello

flowchart

---------

Lord of the Coins (WIP)

Overview: Players create their own character in a fantasy setting and must defeat enemies by gearing up and smashing down. Players buy equipment and fight monsters to make coin in this fantasy game.

title screen

*shows total number of monsters defeated*

*shows total number of runs completed*

menu: new character, *load character (last name used, money)*, quit

**Player creates a character (name, style)**

Ask user input for name - error empty field, integer/symbol 

Asks user questions that determine their class (strength, speed, fortitude) error wrong input, integer, empty field

sword +str, speed +dex, fortitude +hp

hp | str more dmg | dex harder to hit | 

**buy** 

buy weapons/armour/maybe items from a list with name and price

change stats

 error if gold < zero

**battle**

user fights monster by taking turns attacking

attack/skill/item/end turn

attack by generating a number + stat

error health shouldnt go negative

enemy class; hp str dex

**post battle**

player wins by defeating enemy and gets $

player loses if health <= 0

**Re-prompt**

Another day with same character, new character or quit

*save character and continue*

*save character and quit*

**Polish**

if time allows: *give player 3 actions before they have to battle, to raise stats/make money*

____________________________________

Reaction time test/game - Spaghetti Western Shoot Out

user waits for a prompt and has to react as fast as they can

Beat a defined time each level | if not they die "get shot"

your score is based on how fast you are maybe the lower the better

High scores are saved

------------------------------------------------------------------------------------------------------

casino

user has money

blackjack/roulette

bet money

___________________________________

gems

json - file handling

artii ascii font

colorize - gives text color

progress bar - for hp

----------------------

## Link to Source Control Repository

https://github.com/wpham1/terminalapp

## Statement of Purpose

The application will take user inputs to create an interactive story with a customised character that the player takes control of to buy items from a fantasy merchant and battle with monsters. The scope of this application is quite big as it requires multiple facets to interact with each other, I will be breaking down and working on small bits of code first before connecting them together.

The application is made for entertainment purposes, so it will hold the players' attention and hopefully give pleasure and delight. As the story of the application is dictated by the users' input, the interaction aspect will provide amusement and fun, the management of gold and fantastical elements also serves to alleviate boredom. The application will reduce stress and provide escapism from reality.

I am developing this application because I am interested in game development and this is a good way to combine my interests and test my programming abilities.

The target audience would be for an audience looking for an entertaining experience and looking to destress and relax. A member of the target audience will use the application for recreational purposes, but I would also like my application to inspire others to create something in Ruby too.

Here are some User Stories that I have thought about before proceeding with my code.

"As Rory, I want to be entertained, so I can feel relaxed after being at work all day."

"As Kim, I want to see what can be achieved with Ruby, so I can be inspired to create something fun with Ruby"

The user will create their own character by using the terminal to input their character name, answer questions to develop the character, spend gold to equip their character with weapons and select combat prompts in battle to defeat monsters.

| R6   | **Develop** a list of features that will be included in the application. It must include: - at least THREE **features** - **describe** each feature  **Note:** **Ensure** that your features above allow you to demonstrate your understanding of the following language elements and concepts: - use of variables and the concept of variable scope - loops and conditional control structures - error handling  **Consult with your educator** to check your features are sufficient . | 300 words (approx. 100 words per feature) |
| ---- | ------------------------------------------------------------ | ----------------------------------------- |

## List of Features

### Character Creation

Users will be able to create their own character.

As the user will be creating their own character, I will be utilising instance variables to store that information in a class that I can access at future dates.

When the user inputs their name I have incorporated a loop so that whenever they fail to enter something besides alphabetical characters it runs the loop again until they are successful.

After their name has been made, the user will then choose an option out of three questions that will determine how strong and fast their character will be.





| R7   | **Develop** an **outline** of the user interaction and experience for the application. Your outline must include: - how the user will find out how to interact with / use each feature - how the user will interact with / use each feature - how errors will be handled by the application and displayed to the user |
| ---- | ------------------------------------------------------------ |

| R8   | **Develop** a diagram which describes the control flow of your application. Your diagram must: - show the workflow/logic and/or integration of the features in your application for each feature. - utilise a recognised format or set of conventions for a control flow diagram, such as UML. |
| ---- | ------------------------------------------------------------ |

| R9   | **Develop** an implementation plan which: - **outlines** how each feature will be implemented and a checklist of tasks for each feature - prioritise the implementation of different features, or checklist items within a feature - provide a deadline, duration or other time indicator for each feature or checklist/checklist-item  Utilise a suitable project management platform to track this implementation plan  > Your checklists for each feature should have at least 5 items. |
| ---- | ------------------------------------------------------------ |

| R10  | **Design** help documentation which includes a set of instructions which accurately **describe** how to use and install the application.  You must include: - steps to install the application - any dependencies required by the application to operate - any system/hardware requirements |
| ---- | ------------------------------------------------------------ |