class UsersController < ApplicationController
  def new
    @user = User.new 
    render :new 
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      log_in(@user)
      redirect_to links_url           #TODO Need links page or need to change this
    else 
      flash[:errord] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user.find(params[:id])       #This might be a bad practice - ask if this allows people to potentially destroy other users just by looking them up by id#
    @user.destroy!
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
