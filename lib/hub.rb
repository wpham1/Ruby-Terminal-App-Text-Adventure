require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"
require "./character.rb"

$prompt = TTY::Prompt.new

class Hub
    attr_accessor :menu
    attr_accessor :hub
    attr_accessor :name
    attr_accessor :hit_points
    attr_accessor :strength
    attr_accessor :dexterity
    attr_accessor :gold
    attr_accessor :character_trait
    attr_accessor :inventory

    def initialize
        @hub
        location
    end
    def location
        puts "You awake in a small town surrounded by trees."
        hub = $prompt.select("Where would you like to go?") do |place|
            place.choice "Enter Shop (buy items)", 1
            place.choice "Enter Forest (fight a monster)", 2
        end
        if hub == 1
         Shop.new
        elsif  hub == 2
            puts "you wander into the forest and encounter a monster"
        else
            puts "you no"
        end
     end
end

class Shop
    #initialise shop attributes
    def initialize
        @menu_select
        puts "you enter store"
        menu_list
    end

    #displays tty-prompt menu list
    def menu_list
    @menu_select = $prompt.select("What did you want to purchase?") do |menu|
        menu.enum "."

        menu.choice name: "Sword of Destruction; 20 gold", value: 1
        menu.choice name: "Shield; 20 gold", value: 2
        menu.choice name: "Stick; 10 gold", value: 3
        menu.choice name: "Exit", value: 4
        end
        #selection 1
        if @menu_select == 1
             if $gold < 20
                puts "you cannot afford that"
                puts $gold
                menu_list
             elsif $inventory.include?("Sword")
                puts "you have that already"
                puts "Inventory: #{$inventory}"
                menu_list 
            else 
                $gold -= 20
                $inventory << "Sword"   
                puts "Inventory: #{$inventory}"
                puts "you have #{$gold} gold left"
                puts "did you want to buy something else?"
                menu_list
             end
        #selection 2
        elsif @menu_select == 2
            if $gold < 20
                puts "you cannot afford that"
                puts $gold
                menu_list
             elsif $inventory.include?("Shield")
                puts "you have that already"
                puts "Inventory: #{$inventory}"
                menu_list 
            else 
                $gold -= 20
                $inventory << "Shield"   
                puts "Inventory: #{$inventory}"
                puts "you have #{$gold} gold left"
                puts "did you want to buy something else?"
                menu_list
             end
        #selection 3
        elsif @menu_select == 3
            if $gold < 20
                puts "you cannot afford that"
                puts $gold
                menu_list
             elsif $inventory.include?("Stick")
                puts "you have that already"
                puts "Inventory: #{$inventory}"
                menu_list 
            else 
                $gold -= 20
                $inventory << "Stick"   
                puts "Inventory: #{$inventory}"
                puts "you have #{$gold} gold left"
                puts "did you want to buy something else?"
                menu_list
             end
        #selection 4
        elsif @menu_select == 4
            Hub.new
       end   
    end

    def to_s
        # puts "you have #{player_character.@gold}gold"
    end
end

Hub.new