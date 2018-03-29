require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')


#index
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end


#new
get '/pizza_orders/new' do
  erb(:new)
end

#show

get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

#create

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#delete

post '/pizza_orders/:id/delete' do
  PizzaOrder.delete(params[:id].to_i)
  erb(:delete)
end
#edit

get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

#update
post '/pizza_orders/:id/edit' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb (:show)
end
