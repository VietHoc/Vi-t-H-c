 #** Config **#
require 'bundler'
Bundler.require()

#** COnnection **
ActiveRecord::Base.establish_connection({
		:adapter => 'postgresql',
		:database => 'all_the_cheese' 
	})

#**Model **
require './models/cheese'


#** Routes**


# -READ ALL: index -
get 'cheeses' do
	@cheeses = Cheeses.all
	erb:'cheeses/index'
end


#- FORM for CREATING: new
get '/cheeses/new'
	erb: 'cheeses/new'
end
#- CREATE NEW CHEESE:create -
post '/cheeses' do
	cheese = Cheese.create(params[:cheese])
	redirect "/cheeses/#{ cheese.id }"
end


# -READ INDIVIDUAL: show -
get '/cheeses/:id' do
	@cheese = Cheese.find(params[:id])
	erb: 'cheeses/show'
end


# -FROM for UPDATING: edit -
get '/cheeses/:id/edit' do
	@cheese = Cheese.find(params[:id])
	erb: 'cheeses/edit'
end
# -UPDATE CHEESE: update -
put '/cheeses/:id' do
	cheese = Cheese.find(params[:id])
	cheese.update(params[:cheese])
	redirect "/cheeses/#{ cheese.id}"
end



# -destroy cheese: destroy -
delete '/cheese/:id' do
	cheese = Cheese.find(params[:id])
	redirect '/cheese'
end