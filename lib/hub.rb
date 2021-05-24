require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"
# require "./character.rb"

$prompt = TTY::Prompt.new

class Hub
    attr_accessor :menu
    attr_accessor :hub
    attr_accessor :character
    attr_accessor :gold

    def initialize
        @hub = hub
        @name
        location
    end
    def location
        puts "You awake in a small town surrounded by trees."
        @hub = $prompt.select("Where would you like to go?") do |place|
            place.choice "Enter Shop (buy items)", "Shop"
            place.choice "Enter Forest (fight a monster)", "Forest"
          end
          if @hub == "Shop"
            puts "you enter store"
            puts "you have #{@gold} gold"
          elsif @hub == "Forest"
          puts "you wander into the forest and encounter a monster"
          end
     end
end

class Shop
    def initialize

    end
end
