# frozen_string_literal: true

# Points to the post model and allows the user to create a new message
class PostsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user

  def new
    render :new, layout: false
  end

  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.find(params[:id])
    @like = current_user.likes.find_by(post_id: @post.id)
  end

  def create
    @post = current_user.posts.create!(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
