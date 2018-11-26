class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :search

  def search
  	@q = Anime.ransack(params[:q])
    @search_animes = @q.result(distinct: true).page params[:page]
    @count = @q.result(distinct: true).count
  end
end
