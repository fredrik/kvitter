#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'kvitter'
require 'choice'
# thanks, cijoe.

Choice.options do
  banner "usage: #{File.basename(__FILE__)} [-v]"
  header ''
  header 'options:'
  
  
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
# ..
