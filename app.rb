require 'sinatra/base'
require 'sinatra/reloader'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'

class ChitterManager < Sinatra::Base
  Rack::Builder.parse_file('config.ru').first

  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    erb(:index, locals: { peeps: Peep.all})
  end

  post '/peeps' do
    Peep.create(message: params[:message], timestamp: params[:timestamp])
    redirect '/peeps'
  end

  run! if app_file == $0
end
#
# Peep.create(message: 'TestMessage', username: 'Testuser', fullname: 'TestFull Name', timestamp: '2000-10-10 00:00:00')
#
# Peep.create(message: params[:message], timestamp: params[:timestamp])