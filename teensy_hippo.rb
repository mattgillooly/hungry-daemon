# a Hunngrypotamus joint, 2012

require './hippo.rb'
require 'serialport'

class TeensyHippo < Hippo

  CLAIMED = 'c'
  ABANDONED = 'a'
  BITE = 'b'
  GLOAT = '!'

  RED_ON = 'R'
  RED_OFF = 'r'
  GREEN_ON = 'G'
  GREEN_OFF = 'g'
  BLUE_ON = 'L'
  BLUE_OFF = 'l'

  def initialize(hippo_file)
    @hippo_file = hippo_file
    super()
  end

  def bite
    serial_port_write(BITE)
    super
  end

  def gloat
    serial_port_write(GLOAT)
    super
  end

  def claim
    serial_port_write(CLAIMED)
    super
  end

  def abandon
    serial_port_write(ABANDONED)
    super
  end



  # extra methods that the Teensy program understands,
  # but that aren't part of the event API

  def red_on
    serial_port_write(RED_ON)
  end

  def red_off
    serial_port_write(RED_OFF)
  end

  def green_on
    serial_port_write(GREEN_ON)
  end

  def green_off
    serial_port_write(GREEN_OFF)
  end

  def blue_on
    serial_port_write(BLUE_ON)
  end

  def blue_off
    serial_port_write(BLUE_OFF)
  end



  def serial_port_write(s)
    @sp ||= SerialPort.new @hippo_file, 9600
    @sp.write(s)
  end
  private :serial_port_write

end
