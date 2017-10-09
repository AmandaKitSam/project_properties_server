class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      render :json => user
    else
      flash[:error] = "Invalid email or password"
      render :json => { error: "Invalid email or password" }
      # redirect_to login_path # don't need this ?
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect_to root_path # don't need this ?
  end
end
