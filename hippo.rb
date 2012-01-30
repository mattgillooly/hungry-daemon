# a Hunngrypotamus joint, 2012

class Hippo

  def initialize
    @claimed = false
  end

  def bite
  end

  def gloat
  end

  def claim
    was_claimed = @claimed

    @claimed = true

    # return false if it had already been claimed by someone else
    !was_claimed
  end

  def abandon
    was_claimed = @claimed

    # mark it as abandoned no matter what
    @claimed = false

    # return false if it wasn't claimed to begin with
    was_claimed
  end

end
