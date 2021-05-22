require "tty-prompt"
require "artii"
require "colorize"
require_relative "ascii_art.rb"

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
# sleep(3)
system "clear"
# sleep(1)
Ascii_art.new.fire_place
require_relative "character"

