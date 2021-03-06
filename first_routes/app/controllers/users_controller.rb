class UsersController < ApplicationController

    def index 
        if params.has_key?(:username)
           @user = User.find_by(username: params[:username])
            
            if @user.nil? 
              render plain: "User does not exist"
            else 
                render json: @user
            end

        else 
            @users = User.all
            render json: @users
        end
       
    end

   

    def create
        user =  User.new(user_params)
        
        if user.save
            redirect_to user_url(user.id)
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy 
        redirect_to users_url
    end

   
    def user_params
        params.require(:user).permit(:username)
    end
end