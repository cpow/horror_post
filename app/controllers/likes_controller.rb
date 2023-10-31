# frozen_string_literal: true

# UserPostLikesController
class LikesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user
  before_action :set_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to @post
  end

  def destroy
    @post.likes.find_by(user_id: current_user.id).destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
