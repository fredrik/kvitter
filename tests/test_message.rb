$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'kvitter'
require 'test/unit'

class TestMessage < Test::Unit::TestCase
  def test_create
    params = {}
    params[:user]    = "bob"
    params[:message] = "heh, that's just tremendous."
    message = Kvitter::Message.create(params)
    assert message.valid?
    assert_equal message.user,    "bob"
    assert_equal message.message, "heh, that's just tremendous."

    assert_raise ArgumentError do
      Kvitter::Message.create({})
    end
  end
end

