# frozen_string_literal: true

# UserPostLikesController
class LikesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user
  before_action :set_post

  def create
    @like = @post.likes.create(user_id: current_user.id)
    render "posts/unlike", layout: false
  end

  def destroy
    @post.likes.find_by(user_id: current_user.id).destroy
    render "posts/like", layout: false
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
