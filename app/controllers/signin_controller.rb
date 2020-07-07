class SigninController < ApplicationController
    def index
    end

    def signin
        username = params[:user][:username]
        password = params[:user][:password]
        
        if exists(username) and authenticate(username, password)
            session[:user] = User.find_by(username: username)
            redirect_to "/inbox"
        else
            render plain: "Invalid username or password"
        end
    end

    def exists(username)
        user = User.find_by(username: username)
        return user != nil
    end

    def authenticate(username, password)
        user = User.find_by(username: username)
        return user.password == password
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :admin)
    end
end
