class LiftController < ApplicationController

  get '/lifts/new' do
    if logged_in?
      erb :'lifts/new'
    else
      redirect to '/login'
    end
  end

  post '/lifts/new' do
    lift = Lift.create(params)
    @user = current_user
    @user.lifts << lift
    @user.save
    binding.pry
    erb :'/lifts/lifts'
  end

  get '/lifts' do
  if !logged_in?
    redirect to '/login'
  else

    @user = current_user
    @lifts = Lift.all
erb :'lifts/lifts'
  end
end

end
