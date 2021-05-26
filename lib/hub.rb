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
    def initialize
        @menu_select
        puts "you enter store"
        menu_list
    end

    def menu_list
    @menu_select = $prompt.select("What did you want to purchase?") do |menu|
        menu.choice name: "Sword of Destruction; 20 gold", value: 1
        menu.choice name: "Shield; 20 gold", value: 2
        menu.choice name: "Stick; 10 gold", value: 3
        end
        if @menu_select == 1
             $gold -= 20
            puts "you have #{$gold} gold"
       elsif @menu_select == 2
            $gold -= 20
       elsif @menu_select == 3
            $gold -= 10
       end   
    end

    def to_s
        # puts "you have #{player_character.@gold}gold"
    end
end

# Hub.new