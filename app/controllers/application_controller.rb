# frozen_string_literal: true

# ApplicationController is the parent class of all controllers in the app.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper

  def logged_in_user
    return if logged_in?

    redirect_to login_path
  end
end
