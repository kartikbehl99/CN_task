class SignupController < ApplicationController
    def index
    end

    def create
        if !exists(params[:user][:username])
            @user = User.new(user_params)
            if @user.save
                redirect_to "/signin"
            else
                render plain: "Error"
            end
        else
            render plain: "User already exists"
        end
    end

    def show
        
    end

    def exists(username)
        user = User.find_by(username: username)
        return user != nil
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :admin)
    end
end
