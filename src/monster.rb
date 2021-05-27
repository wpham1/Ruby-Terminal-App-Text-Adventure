# gems
require "tty-prompt"
require "artii"
require "colorize"

# require_relative "ascii_art.rb"

class Monster

    attr_accessor :monster_name
    attr_accessor :monster_hit_points
    attr_accessor :monster_strength
    attr_accessor :monster_dexterity

    def initialize(monster_name)
    monster_name
    $monster_hit_points = 30 + rand(0..5)
    $monster_strength = rand(1..5)
    $monster_dexterity = 10 + rand(1..6)
    end

    def monster_name
    list_of_monster_names = ["gary", "jim", "goblin", "dragon"]
    @monster_name = list_of_monster_names.sample
     end

    def alive?
        $monster_hit_points > 0
      end
end

# monster = Monster.new("").to_s