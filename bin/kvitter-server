#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'kvitter'
require 'choice'
# thanks, cijoe.

Choice.options do
  banner "usage: #{File.basename(__FILE__)} [-v]"
  header ''
  header 'options:'

  option :host do
    d = "0.0.0.0"
    short '-h'
    long '--host=HOST'
    desc "The hostname or ip of the host to bind to (default #{d})"
    default d
  end

  option :port do
    d = Kvitter::Server::DefaultPort
    short '-p'
    long '--port=PORT'
    desc "The port to listen on (default #{d})"
    cast Integer
    default d
  end

  separator ''
  separator 'lowly options:'

  option :version do
    short '-v'
    long '--version'
    desc 'show version.'
    action do
      puts "#{File.basename(__FILE__)} v#{Kvitter::Version}"
      exit
    end
  end

end

options = Choice.choices
Kvitter::Server.start(options[:host], options[:port])
