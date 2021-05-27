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

    
end

Game.new


