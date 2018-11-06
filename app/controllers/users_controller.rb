class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @saved = current_user.adds
    @top_airing_animes   = Anime.select_top_airing
    @top_upcoming_animes = Anime.select_top_upcoming
  end
end
