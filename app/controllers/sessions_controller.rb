class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user 
      log_in(@user)
      redirect_to links_url         #TODO need to make links url route 
    else 
      flash[:errors] = "Invalid login credentials"
      render :new
    end
  end

  def destroy
    log_out!
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
