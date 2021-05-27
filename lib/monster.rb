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

    def initialize(monster_name)
    monster_name
    @montser_hit_points = 10 + rand(0..5)
    $monster_strength = rand(1..5)
    $monster_dexterity = rand(1..6)
    end

    def monster_name
    list_of_monster_names = ["gary", "jim", "goblin", "dragon"]
    @montser_name = list_of_monster_names.sample
     end

    def to_s
        puts "The monster you encounter is called #{@monster_name}"
        puts $monster_strength
    end

    def alive?
        @monster_hit_points > 0
      end
end

# monster = Monster.new("").to_s