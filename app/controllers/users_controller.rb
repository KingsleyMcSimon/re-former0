class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        # @user = User.new(user_params)

  if @user.save
    redirect_to new_user_path
  else
    render :new
  end
    end

    private  # Best to make helper methods like this one private

    # gives us back just the hash containing the params we need to
    # to create or update a user
    def user_params
      params.require(:user).permit(:useraname,:email,:password)
    end
end
