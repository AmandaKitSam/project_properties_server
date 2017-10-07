class UsersController < ApplicationController

  # After application_controller, write the before_action in users_controller
  before_action :check_if_logged_in, :only => [:edit]
  before_action :check_if_admin, :only => [:index]

  # A page for index.html.erb
  def index
    @users = User.all
  end

  # A page for new.html.erb
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    # if params[:user][:password].empty?
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      # (Go back to the home page)
    else
      render :new
      # Show them the new(form) again
    end
  end

  # A page for edit.html.erb
  def edit
    redirect_to root_path unless @current_user.id == params[:id].to_i
    # Make sure no one can edit other's profile / .to_i means turn it to integers(numbers)
    @user = User.find params[:id]
  end

  def update
    # user = User.find params[:id]
    user = @current_user

    # cloudinary = Cloudinary::Uploader.upload( params["user"]["userPhoto"] )
    # user.userPhoto = cloudinary["url"]

    user.update user_params
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :location, :name)
  end

end
