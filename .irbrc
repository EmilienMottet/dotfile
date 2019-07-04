require "pp"

require "wirble"

# Initialize Wirble
Wirble.init

# Enable colored output
Wirble.colorize

require "irb/completion"

require "irb/ext/save-history"
# Number of lines/commands to save

IRB.conf[:SAVE_HISTORY] = 100
# The location to save the history file
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
