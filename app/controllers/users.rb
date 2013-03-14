post '/login' do
  if User.authenticate(params[:username], params[:password])
    p 'authenticated!!!'
    p params[:username]
    p User.find_by_username(params[:username]).id
    @current_user = session[:user_id] = User.find_by_username(params[:username]).id
    @username = session[:username] = params[:username]
    @password = session[:password] = params[:password]
    erb :profile
    redirect '/profile'
  else
    p 'bounced!!!!'
    erb :timeout
  end 
end

post '/signup' do
  User.create(params)
    @username = session[:username] = params[:username]
    @password = session[:password] = params[:password]
  redirect '/profile'
end


get '/profile' do
  if User.authenticate(session[:username], session[:password])
        p 'authenticated!!!'
    @current_user = session[:user_id]
    # = session[:user_id] = User.find_by_username(params[:username]).id
    @username = session[:username]
    @password = session[:password]

    erb :profile
  else
    erb :timeout
  end
end


get '/logout' do
  session.clear
  redirect '/'
end

# THIS IS A SESSION: {:username => 'laskdjfslkdfj@gmail.com', :password => 'password'}

#<User id: 50, username: "coy.dibbert@pfeffer.org", password: "password", 
  # name: "Jovan Schmeler DDS", created_at: "2013-03-13 17:17:56", updated_at: "2013-03-13 17:17:56">
