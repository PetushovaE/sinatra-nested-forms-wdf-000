require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    get '/' do 
 	    erb :root
    end

    get '/new' do 
     erb :"pirates/new"
    end

    post '/pirates' do
     @pirate = Pirate.new(params[:pirate])

     params[:pirate][:ships].each do |details|
      Ship.new(details)
    end
      
      @ships = Ship.all

  	 erb :'pirates/show'
    end
  end
end


# version without iteration:
    # binding.pry
    # @ship1 = Ship.new(name: params[:pirate][:ships][0][:name], type: params[:pirate][:ships][0][:type], booty: params[:pirate][:ships][0][:booty])
    # @ship2 = Ship.new(name: params[:pirate][:ships][1][:name], type: params[:pirate][:ships][1][:type], booty: params[:pirate][:ships][1][:booty])
    