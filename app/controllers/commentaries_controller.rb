class CommentariesController < ApplicationController
  before_action :set_post
  
  # /posts/:id/commentaries
  # Merge user_name to commentarie if disponible
  def create
    if current_user
      @post.commentaries.create(commentary_params.to_h.merge!({ author_name: current_user.name }))
    else
      @post.commentaries.create(commentary_params)
    end
    redirect_to post_path(@post)
  end

  private

  # Set post to comment
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Params permiteds to commentaries creation
  def commentary_params
    params.require(:commentary).permit(:body, :author_name)
  end
end
