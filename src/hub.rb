require "tty-prompt"
require "artii"
require "colorize"
require "ruby-progressbar"

require_relative "ascii_art.rb"
require_relative "character.rb"


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
            progressbar = ProgressBar.create(format: "%t: Entering forest... |\e[0;32m%B\e[0m|")
            100.times { progressbar.increment; sleep 0.01 }
            system "clear"
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
    @menu_select = $prompt.select("The Merchant nods. What did you want to purchase?", cycle: true) do |menu|
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
            elsif $gold == 0 || $gold < 30
                system "clear"
                puts "When you open your coin purse dust blows into your face."
                puts "You're too broke chump"
                checkout
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
            elsif $gold == 0 || $gold < 20
                system "clear"
                puts "A moth flies out of your coin pouch."
                puts "You need more gold for that."
                checkout
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
             elsif $gold == 0 || $gold < 10
                system "clear"
                puts "You're embarrassed because you can't afford a stick"
                puts "A spider crawls out of your coin pouch."
                checkout
            else 
                $gold -= 10
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
                    puts "Not enough gold."
                    puts "Guess you'll have to stick with your land boots."
                    checkout
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

class Combat
    attr_accessor :hit_points
    attr_accessor :strength
    attr_accessor :dexterity
    attr_accessor :monster_dexterity
    def initialize
        @fight_select
        Monster.new("").to_s
        Ascii_art.new.ascii_monster
        enemy_announcement
        display_monster_stats
        display_player_stats
        fight_selection
    end
    def enemy_announcement
    puts "An enemy ambushes you through the trees! Engage in combat!!"
    end
    def display_monster_stats
        puts "jims stats"
    end
    def display_player_stats
        puts "your stats mate"
    end
    def fight_selection
        $prompt = TTY::Prompt.new
        @fight_select = $prompt.select("What do you want to do?", cycle: true) do |fight|
            fight.enum "."
            fight.choice name: "Attack!!", value: 1
            fight.choice name: "Dodge", value: 2
        end
            if @fight_select == 1
                attack
            elsif @fight_select == 2
                puts "you dodge"
                @hit_points - 200
            end
        end
    def attack
        hit_chance = rand(1..20) + $strength
        if hit_chance >= $monster_dexterity
            $monster_hit_points -= $strength
            sleep(1)
            puts $monster_hit_points
            puts "You successfully hit the monster for #{$strength} damage."
            fight_selection
        elsif hit_chance < $monster_dexterity
            sleep(1)
            puts "You missed your attack"
            fight_selection
        end
    end

    
end


# Hub.new