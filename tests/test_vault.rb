$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'kvitter'
require 'test/unit'

class TestMessage < Test::Unit::TestCase
  def setup
    # create database.
  end
  def teardown
    # disable and drop database.
  end
  def test_store
    # ...
  end
end

