# gems
require "tty-prompt"
require "artii"
require "colorize"

# require_relative "ascii_art.rb"

class Monster

    attr_accessor :name
    attr_accessor :hit_points
    attr_accessor :strength
    attr_accessor :dexterity

    def initialize(name)
    monstername
    @hit_points = 10 + rand(0..5)
    @strength = rand(1..5)
    @dexterity = rand(1..6)
    end

    def monstername
    list_of_monster_names = ["gary", "jim", "goblin", "dragon"]
    @name = list_of_monster_names.sample
    puts @name
    end

    def to_s
        puts "The monster you encounter is called #{@name}"
        puts @strength
    end


end

# monster = Monster.new("").to_s