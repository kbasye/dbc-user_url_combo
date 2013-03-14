get '/' do
  # Look in app/views/index.erb
  erb :start
end

post '/new' do
  @url = Url.new(original: params[:original], user_id: session[:user_id])
    
  if session[:user_id].nil?

    if @url
      @just_added = Url.last 
      erb :successful_url
    else
      erb :unsuccessful_url
    end

  else
    if @url
      redirect '/profile'
    else
      erb :unsuccessful_url
    end

  end

end



get '/:short' do
  puts "weeeeee-->#{params[:short]}"
  pass if params[:short] =~ /(favico|profile|logout)/
  @short = params[:short]
  @url = Url.find_by_short(@short)

  Url.increment_counter(@url)
  redirect @url.original
end



# user clicks save
# if it's valid, we have to:
  # 1. generate the short url
  # 2. increment the counter
