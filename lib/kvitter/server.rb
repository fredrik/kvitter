require 'rubygems'
require 'sinatra/base'

class Kvitter::Server < Sinatra::Base
  DefaultPort = 9000

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


  def self.start(host, port)
    Kvitter::Server.run! :host => host, :port => port
  end
end
