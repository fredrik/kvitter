require 'rubygems'
require 'hbase-thrift/hbase'
# hbase thrift interface
# generated from hbase-0.20.1/src/java/org/apache/hadoop/hbase/thrift/Hbase.thrift

class Kvitter
  class Vault
    # creates a message from params and stores it in the vault.
    # returns nil on failure, the new message otherwise.
    def self.store(params)
      message = Kvitter::Message.create(params)
      return nil unless message.valid?
      # save message to data store.
      print "HBASE."
      table="kvitter"
      rowkey=self.message_to_rowkey(message)
      # yeah.
      transport = Thrift::BufferedTransport.new(Thrift::Socket.new("localhost", "9090"))
      transport.open
      client = Apache::Hadoop::Hbase::Thrift::Hbase::Client.new(Thrift::BinaryProtocol.new(transport))
      mutations = []
      mutations << Apache::Hadoop::Hbase::Thrift::Mutation.new(:column => 'attrs:message', :value => message.message)
      mutations << Apache::Hadoop::Hbase::Thrift::Mutation.new(:column => 'attrs:user', :value => message.user)
      mutations << Apache::Hadoop::Hbase::Thrift::Mutation.new(:column => 'attrs:timestamp', :value => message.timestamp)
      ret = client.mutateRow(table, rowkey, mutations)
      print "mutate: "
      print ret
      # TODO> might this ever fail? yes.
      return message
    end
    # formats message to rowkey.
    # TODO: this should live in hbase-specific code.
    def self.message_to_rowkey(message)
      return "#{message.user}-#{message.timestamp}"
    end
  end
end
