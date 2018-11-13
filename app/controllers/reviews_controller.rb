class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_anime, only: [:show, :edit]

  def index
    @review = @anime.reviews.include(:user)
  end

  def create
    review = Review.new(review_params)
    if !review.review_score.nil? && review.review_description.length > 100 && review.review_description.length < 250
      if review.save
        score = review.anime.reviews.average(:review_score).round(2)
        Anime.update(review.anime.id, {score: score})
        @anime = review.anime
        respond_to :js
        flash[:notice] = "Created review"
      else
        flash[:danger] = "Something went wrong..."
        redirect_to root_path
      end
    else
      flash[:danger] = "Please rating and enter a review (250 characters)"
    end
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      score = @review.anime.reviews
      if score.length != 0
        score = score.average(:review_score).round(2)
      else
        score = 0
      end
      Anime.update(@review.anime.id, {score: score})
      @anime = @review.anime
      respond_to :js
      flash[:notice] = "Deleted review"
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
      @params = params.require(:review).permit(:review_score, :review_description, :anime_id, :user_id)
    end
end
