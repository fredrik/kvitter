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
  # TODO> keep Vault instance so to not set up connection for each store.
  if Kvitter::Vault.store(params)
    return "got it, thanks."
  else
    # TODO> handle failure.
    return "something went wrong, charles."
  end
end
