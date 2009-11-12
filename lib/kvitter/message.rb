# messages are immutable objects.
class Kvitter
  class Message
    attr_reader :message, :user, :timestamp
    def initialize(message, user)
      @message   = message
      @user      = user
      @timestamp = Time.now.to_i.to_s
      # certainly, with two updates on the same second, the first one is overwritten.
    end
    def self.create(params)
      Message.new(params[:message], params[:user])
    end

    def valid?
      # message is valid if it has
      #  + message of correct size
      #  + user.
      # TODO> check if user exists (here, or in the vault).
      @message and (not @message.empty?) and (@message.length <= 256) and
      @user and (not @user.empty?)
    end

  end
end
