# def humanized_time_ago(time_ago_in_minutes)
#     if time_ago_in_minutes >= 60
#         "#{time_ago_in_minutes/60} hours ago"
#     else
#         "#{time_ago_in_minutes} minutes ago"
#     end
# end

# get '/' do
#     @finstagram_post_shark = {
#         username: "sharky_j",
#         avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg",
#         photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg",
#         humanized_time_ago: humanized_time_ago(15),
#         like_count: 0,
#         comment_count: 1,
#         comments: [{
#             username: "sharky_j",
#             text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
#      }]
#     }

#     @finstagram_post_whale = {
#     username: "kirk_whalum",
#     avatar_url: "https://live.staticflickr.com/65535/52358421348_f34c7996b1.jpg",
#     photo_url: "https://live.staticflickr.com/65535/52357237337_1cc718f6a7_4k.jpg",
#     humanized_time_ago: humanized_time_ago(65),
#     like_count: 0,
#     comment_count: 1,
#     comments: [{
#       username: "kirk_whalum",
#       text: "#weekendvibes"
#     }]
#   }

#   @finstagram_post_marlin = {
#     username: "marlin_peppa",
#     avatar_url: "https://live.staticflickr.com/65535/52358415933_0a0e6bc35f_3k.jpg",
#     photo_url: "https://live.staticflickr.com/65535/52358494794_f88b160d15_4k.jpg",
#     humanized_time_ago: humanized_time_ago(190),
#     like_count: 0,
#     comment_count: 1,
#     comments: [{
#       username: "marlin_peppa",
#       text: "lunchtime! ;)"
#     }]
#   }

#   @finstagram_posts = [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin]

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do

  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)

end

get '/signup' do

  @user = User.new
    erb(:signup)
  
end

post '/signup' do

  email = params[:email]
  avatar_url = params[:avatar_url]
  username = params[:username]
  password = params[:password]



  @user = User.new({email: email, avatar_url: avatar_url, username: username, password: password})
  if  @user.save

    redirect to('/login')

  else

    erb(:signup)

  end

end

get '/login' do

    erb(:login)
  
end

post '/login' do
    
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)

  if @user && @user.password == password
    session[:user_id] = @user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
  
end

get '/logout' do

  session[:user_id] = nil
  redirect to('/')
end

get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id})

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end

get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])
  erb(:"finstagram_posts/show")       
end