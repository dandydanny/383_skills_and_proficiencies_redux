get '/' do
  # render home page
  @users = User.all
  erb :index
end

get '/add' do
  erb :add
end
post '/add' do
  p params
  current_user.skills << Skill.create(name: params[:name], context: params[:context])
  # s.update(years: yr)
  # s.save
  current_user.proficiencies.last.update(years: params[:years], formal: params[:formal])
  redirect('/')
end

get '/acquire' do
  @skills = Skill.all
  erb :acquire
end

post '/acquire' do
  p params
  skill = Skill.find_by(name: params[:skill])
  current_user.skills << skill
  current_user.proficiencies.last.update(years: params[:years], formal: params[:formal])
  redirect('/')
end

get '/edit' do
  @user = current_user
  erb :edit
end

post '/edit' do
  puts "in post edit"
  p params
  return nil
end

# AJAX POST dissociate
post '/dissociate' do
  current_user.proficiencies.find(params[:id]).destroy
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end
