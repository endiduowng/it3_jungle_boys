class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @saved = current_user.adds
  end
end
