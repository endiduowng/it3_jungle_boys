class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_anime, only: [:show]

  def index
    @review = @anime.reviews.include(:user)
  end

  def create
    review = Review.new(review_params)
    if !review.review_story_score.nil? && !review.review_visual_score.nil? && !review.review_audio_score.nil? && review.review_description.length > 1 && review.review_description.length < 250
      review.review_score = (review.review_story_score + review.review_visual_score + review.review_audio_score).fdiv(3).round(1)
      if review.save
        score = review.anime.reviews.average(:review_score).round(2)
        Anime.update(review.anime.id, {score: score})
        @anime = review.anime
        respond_to :js
        flash[:notice] = "Created review"
      else
        flash[:alert] = "Something went wrong..."
        redirect_to root_path
      end
    else
      flash[:alert] = "Please rating and enter a review (250 characters)"
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
        score = score.average(:review_score).round(1)
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
    @review = Review.find(params[:id])
    @anime = @review.anime
    respond_to :js
  end

  def update
    @review = Review.find(params[:id])
    @anime = @review.anime
    review = Review.new(review_params)
    if !review.review_story_score.nil? && !review.review_visual_score.nil? && !review.review_audio_score.nil? && review.review_description.length > 1 && review.review_description.length < 250
      review.review_score = (review.review_story_score + review.review_visual_score + review.review_audio_score).fdiv(3).round(1)
      if @review.update_attributes(review_story_score: review.review_story_score, review_audio_score: review.review_audio_score, review_visual_score: review.review_visual_score, review_description: review.review_description, review_score: review.review_score)
        score = review.anime.reviews.average(:review_score).round(2)
        @anime.update(score: score)
        respond_to :js
        flash[:notice] = "Updated review success"
      else
        flash[:alert] = "Something went wrong..."
      end
    else
      flash[:alert] = "Update failed. Please rating and enter a review (250 characters)"
    end
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  private
    def find_anime
      @review = Anime.find(params[:review])
    end

    def review_params
      @params = params.require(:review).permit(:review_story_score, :review_visual_score, :review_audio_score, :review_description, :anime_id, :user_id)
    end
end
