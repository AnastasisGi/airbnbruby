

require 'rack'
require 'sinatra/base'
require 'sinatra/activerecord'
require_relative './controllers/app_controller'
require_relative './models/user.rb'
require 'sinatra/flash'



class Airbnbruby < Sinatra::Base
    register Sinatra::Flash
    enable :sessions
    

    ERRORS = {
        :login => "Log in failed, please check your credentials"
    }
    
    
        get '/users/new' do 
            erb :users_new
        end


        get '/' do 
          @user = User.find_by(id: session[:user_id])
           erb :index

        end

        post '/users' do
            user = User.new(username: params[:username], email: params[:email])
            user.password = params[:password]
            user.save!
            session[:user_id] = user.id
            redirect '/'
        end


        get '/sessions/new' do 
          erb :sessions_new
        end

        post '/sessions' do 
            user = User.find_by(username: params[:username])
                if user && user.password == params[:password]
                   session[:user_id]=user.id
                   redirect '/'
                else
                    flash[:error] = ERRORS[:login]
                    redirect '/sessions/new'
                end

        end




end

