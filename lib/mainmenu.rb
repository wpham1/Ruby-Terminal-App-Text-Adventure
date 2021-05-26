require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"
require_relative "character"
require_relative "hub"


prompt = TTY::Prompt.new


class Intro
    
    def initialize
        system "clear"
        logo
        # sleep(3)
        system "clear"
        Ascii_art.new.ascii_book
        @player = Character.new("").to_s
        Hub.new   

    end

    def logo
    ascii = Artii::Base.new :font => 'cosmic'
    ascii2 = Artii::Base.new :font => 'cosmike'
    puts ascii.asciify('                t e r m i n a l ').light_red
    puts ascii2.asciify('             c o i n').yellow
    end
end

Intro.new


