#!/usr/bin/env ruby

# dev-mode, please
$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'sinatra'
require 'kvitter'


get '/' do
  "kvitter much?"
end

post '/update' do
  # TODO> auth.
  begin
    message = Kvitter::Message.create(params)
  rescue
    # TODO> handle failure.
  end
  "wha, #{user}."
end
