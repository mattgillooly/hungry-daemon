require 'hippo.rb'
require 'listener.rb'

hippo = Hippo.new("/dev/tty.usbmodem12341")

listener = Listener.new(ENV['PUSHER_KEY'], ENV['PUSHER_SECRET'])
listener.listen('hippo1', hippo)
