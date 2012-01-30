require './teensy_hippo.rb'
require './debug_hippo.rb'
require './listener.rb'

SERIAL_PORT = ENV['TEENSY_SERIAL_PORT'] || "/dev/tty.usbmodem12341"

if File.exists?(SERIAL_PORT)
  hippo = TeensyHippo.new("/dev/tty.usbmodem12341")
else 
  puts "Using a DebugHippo because no serial port was found at #{SERIAL_PORT}"
  hippo = DebugHippo.new
end

listener = Listener.new(ENV['PUSHER_KEY'], ENV['PUSHER_SECRET'])
listener.listen('hippo1', hippo)
