# a Hunngrypotamus joint, 2012

require './hippo.rb'

class DebugHippo < Hippo

  def bite
    puts "Hippo is biting!"
    super
  end

  def gloat
    puts "Hippo is gloating!"
    super
  end

  def claim
    puts "Hippo has been claimed by an online player"
    super
  end

  def abandon
    puts "Hippo has been abandoned by an online player"
    super
  end

end
