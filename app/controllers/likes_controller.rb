class LikesController < ApplicationController

  def create
    # @user = @current_user
    # @post = Post.find params[:post_id]
    # @post.likeit(@user)
    # redirect_to request.referrer || root_path

    # Need to have a Photo model first:
    @like = Like.new( user_id: params["user_id"].to_i, photo_id: params["photo_id"] )
     respond_to do |format|
       if @like.save
         format.html {}
         format.json {}
       end
     end

  end

  def destroy
    likes = Like.where(:post_id => params[:post_id], :user_id => @current_user.id)
    likes.destroy_all
    redirect_to :back
  end

end
