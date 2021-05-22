require "tty-prompt"
$prompt = TTY::Prompt.new

class Hub
    attr_accessor :menu
    attr_accessor :hub

    def initialize
        @hub = hub
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
          elsif @hub == "Forest"
          puts "you wander into the forest and encounter a monster"
          end
     end
end

Hub.new