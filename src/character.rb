#create character and stats

require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"


$prompt = TTY::Prompt.new

# prints neat empty line
def space
    puts ""
end

class Character
    attr_accessor :name
    attr_accessor :hit_points
    attr_accessor :strength
    attr_accessor :dexterity
    attr_accessor :gold
    attr_accessor :character_trait
    attr_accessor :inventory


    def initialize(name)
        @name = name
        @hit_points = 20
        $strength = 5
        $dexterity = 5
        $gold = 100
        @character_trait = character_trait
        $inventory = []
        user_name
        character_power
    end
    #gets user input for character name
    def user_name
        error_check = 0
        loop do 
            puts "Please type in your name, hero."
            user_input = gets.chomp
                if error_check == 5
                    @name = "Hero"
                    break
                elsif user_input.empty?
                    error_check += 1
                    puts "Heroes need a name!"
                elsif user_input =~ (/\d/)
                    error_check += 1
                    puts "Heroes don't have numbers in their name!"
                elsif user_input =~ (/\W/)
                    puts "Heroes don't use symbols in their name!"
                    error_check += 1
                else 
                    @name = user_input
                    break
                end
            end
    end
    # asks what class user wants to be
    def character_power
        @character_trait = $prompt.select("What Power do you seek, #{@name.upcase}?", cycle: true) do |power|
            power.choice "The Power of the warrior. Invincible courage. A sword of terrible destruction.", 1
            power.choice "The Power of the rogue. Swift cunning. A dagger from the shadows.", 2
            power.choice "The Power of the guardian. Kindness to aid friends. A shield to repel all.", 3
        end
        space
        if @character_trait == 1
            $strength += 2
            puts "Strong as ten regular men. You feel stronger than a wet noodle.".light_white.on_light_blue
        elsif @character_trait == 2
            $dexterity += 2
            puts "You are tempted to lick the blade of your dagger. Your feet are nimble and pictures are 5gp.".white.on_red
        elsif @character_trait == 3
            @hit_points += 15
            puts "Doctors fear how many apples you eat. Your glutes are maximum.".light_blue.on_white
        end
    end


    #prints user name an stats
    def to_s
        puts "Your name is #{@name}.".white.on_red
        puts "You have #{@hit_points} hit points.".green
        puts "You have #{$strength} strength and #{$dexterity} dexterity.".cyan
        puts "You have #{$gold} gold in your coin pouch.".yellow
        puts ""
    end

    def attack
    #attack?
    end
    def alive?
        @hit_points > 0
    end
end


# player_character = Character.new("").to_s
