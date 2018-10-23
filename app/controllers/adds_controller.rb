class AddsController < ApplicationController
  def create
    @add = current_user.adds.build(add_params)
    @anime = @add.anime
    if @add.save
      @is_added = @add
      respond_to :js
    else
      flash[:alert] = "Something went wrong..."
    end
  end

  def destroy
    @add = Add.find(params[:id])
    @anime = @add.anime
    respond_to do |format|
      if @add.destroy
        format.html {redirect_to user_path(current_user)}
        format.js
      end
    end
  end

  private
  def add_params
    params.permit :anime_id, :user_id
  end
end
