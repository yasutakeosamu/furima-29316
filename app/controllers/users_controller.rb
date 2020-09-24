class UsersController < ApplicationController
  def show
    redirect_to new_user_session_path unless user_signed_in?
    @user = User.find(current_user.id)
  end
end
