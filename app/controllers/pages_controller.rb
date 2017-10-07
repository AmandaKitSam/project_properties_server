class PagesController < ApplicationController
  def home
    if @current_user.present?
      # @photo = Photo.new
      @user = @current_user
      render :json => {
        # :photo => @photo,
        :user => @user
      }
    end
  end
end
