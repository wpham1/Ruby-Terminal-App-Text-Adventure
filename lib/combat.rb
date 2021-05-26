require "tty-prompt"
require "artii"
require "colorize"
require "ruby-progressbar"

require_relative "ascii_art.rb"
require_relative "character"
require_relative "hub"
require_relative "monster"


class Combat
    def initialize
    monster = Monster.new("").to_s
    end

end