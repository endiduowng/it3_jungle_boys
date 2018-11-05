class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_anime, only: [:show, :edit]

  def index
    @review = @anime.reviews.include(:user)
  end

  def create
    review = Review.new(review_params)
    if review.save
      score = review.anime.reviews.average(:review_score).round(2)
      Anime.update(review.anime.id, {score: score})
      @anime = review.anime
      respond_to :js
    else
      flash[:danger] = "Something went wrong..."
      redirect_to root_path
    end
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @anime = @review.anime
    if @review.destroy
      score = @review.anime.reviews.average(:review_score).round(2)
      Anime.update(@review.anime.id, {score: score})
      respond_to :js
    else
      flash[:danger] = "Something went wrong..."
      redirect_to root_path
    end
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def show; end

  def edit
    
  end

  private
    def find_anime
      @review = Anime.find(params[:review])
    end

    def review_params
      params.require(:review).permit(:review_score, :review_description, :anime_id, :user_id)
    end
end
