class PagesController < ApplicationController
  def home
    if @current_user.present?
      @diary = Diary.new
      @user = @current_user
      render :json => {
        :diary => @diary,
        :user => @user
      }
    end
  end
end
