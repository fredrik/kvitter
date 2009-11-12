#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module Apache
  module Hadoop
    module Hbase
      module Thrift
                # TCell - Used to transport a cell value (byte[]) and the timestamp it was
                # stored with together as a result for get and getRow methods. This promotes
                # the timestamp of a cell to a first-class value, making it easy to take
                # note of temporal data. Cell is used all the way from HStore up to HTable.
                class TCell
                  include ::Thrift::Struct
                  VALUE = 1
                  TIMESTAMP = 2

                  ::Thrift::Struct.field_accessor self, :value, :timestamp
                  FIELDS = {
                    VALUE => {:type => ::Thrift::Types::STRING, :name => 'value'},
                    TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # An HColumnDescriptor contains information about a column family
                # such as the number of versions, compression settings, etc. It is
                # used as input when creating a table or adding a column.
                class ColumnDescriptor
                  include ::Thrift::Struct
                  NAME = 1
                  MAXVERSIONS = 2
                  COMPRESSION = 3
                  INMEMORY = 4
                  BLOOMFILTERTYPE = 5
                  BLOOMFILTERVECTORSIZE = 6
                  BLOOMFILTERNBHASHES = 7
                  BLOCKCACHEENABLED = 8
                  TIMETOLIVE = 9

                  ::Thrift::Struct.field_accessor self, :name, :maxVersions, :compression, :inMemory, :bloomFilterType, :bloomFilterVectorSize, :bloomFilterNbHashes, :blockCacheEnabled, :timeToLive
                  FIELDS = {
                    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
                    MAXVERSIONS => {:type => ::Thrift::Types::I32, :name => 'maxVersions', :default => 3},
                    COMPRESSION => {:type => ::Thrift::Types::STRING, :name => 'compression', :default => %q"NONE"},
                    INMEMORY => {:type => ::Thrift::Types::BOOL, :name => 'inMemory', :default => false},
                    BLOOMFILTERTYPE => {:type => ::Thrift::Types::STRING, :name => 'bloomFilterType', :default => %q"NONE"},
                    BLOOMFILTERVECTORSIZE => {:type => ::Thrift::Types::I32, :name => 'bloomFilterVectorSize', :default => 0},
                    BLOOMFILTERNBHASHES => {:type => ::Thrift::Types::I32, :name => 'bloomFilterNbHashes', :default => 0},
                    BLOCKCACHEENABLED => {:type => ::Thrift::Types::BOOL, :name => 'blockCacheEnabled', :default => false},
                    TIMETOLIVE => {:type => ::Thrift::Types::I32, :name => 'timeToLive', :default => -1}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # A TRegionInfo contains information about an HTable region.
                class TRegionInfo
                  include ::Thrift::Struct
                  STARTKEY = 1
                  ENDKEY = 2
                  ID = 3
                  NAME = 4
                  VERSION = 5

                  ::Thrift::Struct.field_accessor self, :startKey, :endKey, :id, :name, :version
                  FIELDS = {
                    STARTKEY => {:type => ::Thrift::Types::STRING, :name => 'startKey'},
                    ENDKEY => {:type => ::Thrift::Types::STRING, :name => 'endKey'},
                    ID => {:type => ::Thrift::Types::I64, :name => 'id'},
                    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
                    VERSION => {:type => ::Thrift::Types::BYTE, :name => 'version'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # A Mutation object is used to either update or delete a column-value.
                class Mutation
                  include ::Thrift::Struct
                  ISDELETE = 1
                  COLUMN = 2
                  VALUE = 3

                  ::Thrift::Struct.field_accessor self, :isDelete, :column, :value
                  FIELDS = {
                    ISDELETE => {:type => ::Thrift::Types::BOOL, :name => 'isDelete', :default => false},
                    COLUMN => {:type => ::Thrift::Types::STRING, :name => 'column'},
                    VALUE => {:type => ::Thrift::Types::STRING, :name => 'value'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # A BatchMutation object is used to apply a number of Mutations to a single row.
                class BatchMutation
                  include ::Thrift::Struct
                  ROW = 1
                  MUTATIONS = 2

                  ::Thrift::Struct.field_accessor self, :row, :mutations
                  FIELDS = {
                    ROW => {:type => ::Thrift::Types::STRING, :name => 'row'},
                    MUTATIONS => {:type => ::Thrift::Types::LIST, :name => 'mutations', :element => {:type => ::Thrift::Types::STRUCT, :class => Apache::Hadoop::Hbase::Thrift::Mutation}}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # Holds row name and then a map of columns to cells.
                class TRowResult
                  include ::Thrift::Struct
                  ROW = 1
                  COLUMNS = 2

                  ::Thrift::Struct.field_accessor self, :row, :columns
                  FIELDS = {
                    ROW => {:type => ::Thrift::Types::STRING, :name => 'row'},
                    COLUMNS => {:type => ::Thrift::Types::MAP, :name => 'columns', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRUCT, :class => Apache::Hadoop::Hbase::Thrift::TCell}}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # An IOError exception signals that an error occurred communicating
                # to the Hbase master or an Hbase region server.  Also used to return
                # more general Hbase error conditions.
                class IOError < ::Thrift::Exception
                  include ::Thrift::Struct
                  def initialize(message=nil)
                    super()
                    self.message = message
                  end

                  MESSAGE = 1

                  ::Thrift::Struct.field_accessor self, :message
                  FIELDS = {
                    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # An IllegalArgument exception indicates an illegal or invalid
                # argument was passed into a procedure.
                class IllegalArgument < ::Thrift::Exception
                  include ::Thrift::Struct
                  def initialize(message=nil)
                    super()
                    self.message = message
                  end

                  MESSAGE = 1

                  ::Thrift::Struct.field_accessor self, :message
                  FIELDS = {
                    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

                # An AlreadyExists exceptions signals that a table with the specified
                # name already exists
                class AlreadyExists < ::Thrift::Exception
                  include ::Thrift::Struct
                  def initialize(message=nil)
                    super()
                    self.message = message
                  end

                  MESSAGE = 1

                  ::Thrift::Struct.field_accessor self, :message
                  FIELDS = {
                    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
                  }

                  def struct_fields; FIELDS; end

                  def validate
                  end

                end

              end
            end
          end
        end