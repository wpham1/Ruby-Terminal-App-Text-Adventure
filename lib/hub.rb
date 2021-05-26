require "tty-prompt"
require "artii"
require "colorize"
require "ruby-progressbar"

require_relative "ascii_art.rb"
require_relative "character.rb"
require_relative "combat"

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
    attr_accessor :surequit

    def initialize
        @hub
        @surequit = surequit
        location
        @test = TTY::Prompt.new

    end
    def location
        Ascii_art.new.ascii_town
        puts "You find yourself in a small town surrounded by trees."
        hub = $prompt.select("Where would you like to go?") do |place|
            place.choice "Enter Shop (buy items)", 1
            place.choice "Enter Forest (fight a monster)", 2
            place.choice "Quit Game", 3
        end
        if hub == 1
            system "clear"
            Shop.new
        elsif  hub == 2
            puts "You wander into the forest knowing full well you would encounter a monster"
            puts "..."
            Combat.new
        elsif hub == 3
            begin
                exit
                rescue SystemExit
                p "See you next time adventurer!"
            end
        end
     end
end

class Shop
    #initialise shop attributes
    def initialize
        Ascii_art.new.ascii_merchant
        @menu_select
        puts "You find a Merchant selling their wares on the street."
        menu_list
    end

    #displays tty-prompt menu list
    def menu_list
        space
    @menu_select = $prompt.select("The Merchant nods. What did you want to purchase?") do |menu|
        menu.enum "."
        menu.choice name: "Sword of Destruction; 30 gold", value: 1
        menu.choice name: "Shield of Protection; 20 gold", value: 2
        menu.choice name: "Useless Stick; 10 gold", value: 3
        menu.choice name: "Winged Boots of Speed; 50 gold", value: 4
        menu.choice name: "Exit", value: 5
        end
        #selection 1
        if @menu_select == 1
            if $inventory.include?("Sword")
                system "clear"
                got_already
                checkout
            elsif $gold == 0
                puts "When you open your coin purse dust blows into your face."
                menu_list
            elsif $gold < 30
                puts "You're too broke chump"
                puts $gold
                menu_list
            else 
                $gold -= 30
                $inventory << "Sword"   
                checkout
             end
        #selection 2
        elsif @menu_select == 2
            if $inventory.include?("Shield")
            got_already
            checkout
            elsif $gold == 0
                puts "A moth flies out of your coin pouch."
                menu_list
            elsif $gold < 20
                puts "You need more gold for that."
                puts $gold
                menu_list
            else 
                $gold -= 20
                $inventory << "Shield"   
                checkout
             end
        #selection 3
        elsif @menu_select == 3
            if $inventory.include?("Stick")
                got_already
                checkout
             elsif $gold == 0
                puts "A spider crawls out of your coin pouch."
                menu_list
            elsif $gold < 20
                puts "You're embarrassed because you can't afford a stick"
                puts $gold
                menu_list
            else 
                $gold -= 20
                $inventory << "Stick"
                $strength += 100   
                checkout
             end
            elsif @menu_select == 4
                if $inventory.include?("Winged Boots")
                   got_already
                   checkout
                elsif $gold == 0
                    puts "Your coin pouch evaporates."
                    menu_list
                elsif $gold < 50
                    system "clear"
                    puts "Guess you'll have to stick with your land boots."
                    puts $gold
                    menu_list
                else 
                    $gold -= 50
                    $inventory << "Winged Boots"
                    $dexterity += 5   
                    checkout
                 end     
        #selection 5
        elsif @menu_select == 5
            system "clear"
            Hub.new
       end   
    end

    def checkout
        puts "Inventory: #{$inventory}".blue
        puts "You have #{$gold} gold left".yellow
        puts "Did you want to buy something else?"
        menu_list
    end

    def got_already
        system "clear"
        puts "You have that item already"
    end
end

# Hub.new