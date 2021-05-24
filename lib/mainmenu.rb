require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"
require_relative "character"


prompt = TTY::Prompt.new


class Intro
    
    def logo
    ascii = Artii::Base.new :font => 'cosmic'
    ascii2 = Artii::Base.new :font => 'cosmike'
    puts ascii.asciify('                t e r m i n a l ').light_red
    puts ascii2.asciify('             c o i n').yellow
    end
end
system "clear"
Intro.new.logo
sleep(3)
system "clear"
# sleep(1)
Ascii_art.new.ascii_book
player_character = Character.new(@name).to_s
