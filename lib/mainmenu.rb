require "tty-prompt"
require "artii"
require "colorize"
require "ruby-progressbar"

require_relative "ascii_art.rb"
require_relative "character"
require_relative "hub"
require_relative "monster"


prompt = TTY::Prompt.new


class Game
    
    def initialize
        system "clear"
        logo
        # sleep(3)
        system "clear"
        Ascii_art.new.ascii_book
        @player = Character.new("").to_s
        # progressbar = ProgressBar.create(format: "%t: Loading... |\e[0;34m%B\e[0m|")
        # 100.times { progressbar.increment; sleep 0.1 }
        Hub.new   
    end

    def logo
    ascii = Artii::Base.new :font => 'cosmic'
    ascii2 = Artii::Base.new :font => 'cosmike'
    puts ascii.asciify('                t e r m i n a l ').light_red
    puts ascii2.asciify('             c o i n').yellow
    end

    def game_over
        system "clear"
        ascii3 = Artii::Base.new :font => 'cosmic'
        puts ascii3.asciify('G AME OVER').red
        game_really_over = $prompt.select("Play again?") do |gover|
            gover.choice name: "Yes",  value: 1
            gover.choice name: "No", value: 2
        end
        if game_really_over == 1
            puts "See you in the next one."
            system "clear"
            Game.new
        elsif $game_really_over == 2
            begin
                exit
                rescue SystemExit
                p "See you next time adventurer!"
            end
        end
    end
 end
Game.new


