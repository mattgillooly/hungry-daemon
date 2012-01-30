# a Hunngrypotamus joint, 2012

require 'serialport'

class Hippo

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
    @claimed = false
    @hippo_file = hippo_file
  end

  def gloat
    serial_port_write(GLOAT)
  end

  def claim
    was_claimed = @claimed

    # mark it as claimed no matter what
    serial_port_write(CLAIMED)
    @claimed = true

    # return false if it had already been claimed by someone else
    !was_claimed
  end

  def abandon
    was_claimed = @claimed

    # mark it as abandoned no matter what
    serial_port_write(ABANDONED)
    @claimed = false

    # return false if it wasn't claimed to begin with
    was_claimed
  end

  def bite
    serial_port_write(BITE)
  end


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
