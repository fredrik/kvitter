# messages are immutable objects.
class Kvitter
  class Message
    attr_reader :message, :user
    def initialize(message, user)
      @message = message
      @user    = user
      raise ArgumentError.new("message not valid.") unless valid?
      save() # write to hbase.
    end
    def self.create(params)
      Message.new(params[:message], params[:user])
    end
    def valid?
      # message is valid if it has
      #  + message of correct size
      #  + user.
      @message and (not @message.empty?) and (@message.length <= 256) and
      @user and (not @user.empty?)
    end

    private
    def save
      print "HBASE."
    end
  end
end
