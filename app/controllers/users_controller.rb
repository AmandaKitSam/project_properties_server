class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit]
  # before_action :check_if_admin, :only => [:index]


  # A page for index.html.erb
  def index
    @users = User.order(created_at: 'desc')
    render json: @users.to_json(include: [:likes])
  end


  def show
    user = User.find params[:id]
    render json: user.to_json(include: [:likes])
  end


  # A page for new.html.erb
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render :json => @user
    else
      render :json => @user.errors
    end
  end


  # A page for edit.html.erb
  def edit
    redirect_to root_path unless @current_user.id == params[:id].to_i
    @user = User.find params[:id]
  end


  def update
    user = @current_user

    # cloudinary = Cloudinary::Uploader.upload( params["user"]["userPhoto"] )
    # user.userPhoto = cloudinary["url"]

    user.update user_params
    # redirect_to root_path
  end


  def whoami
    render :json => @current_user
  end


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end
