require 'pusher-client'

PusherClient.logger = Logger.new(STDOUT)

class Listener

  def initialize(key, secret)
    @key = key
    @secret = secret
  end

  def listen(channel, hippo)
    socket = PusherClient::Socket.new(@key, {:secret => @secret})

    socket.subscribe(channel)

    socket[channel].bind('bite') do |data|
      puts data
      hippo.bite
    end

    socket[channel].bind('gloat') do |data|
      puts data
      hippo.gloat
    end

    socket[channel].bind('claim') do |data|
      puts data
      hippo.claim
    end

    socket[channel].bind('abandon') do |data|
      puts data
      hippo.abandon
    end

    socket.connect
  end
end
