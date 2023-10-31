class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @comment = @post.comments.new(user_id: current_user.id)
    render :new, layout: false
  end

  def create
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      flash[:danger] = "Comment not created"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
