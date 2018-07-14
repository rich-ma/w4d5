class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
      params[:user][:password] )
    if @user
      login_user(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = ["Wrong username/password combo"]
      redirect_to new_session_url
    end
  end

  def delete

  end

  # private
  # def session_params
  #   params.require(:user).permit(:username, :password)
  # end

end
