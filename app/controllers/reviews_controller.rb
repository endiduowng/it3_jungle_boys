class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_anime, only: [:review]

  def index
    @review = @anime.reviews.include(:user)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @anime = @review.anime
      respond_to :js
    else
      flash[:danger] = "Something went wrong..."
      redirect_to root_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @anime = @review.anime
    if @review.destroy
      respond_to :js
    else
      flash[:danger] = "Something went wrong..."
      redirect_to root_path
    end
  end

  def review; end

  private
    def find_anime
      @review = Anime.find(params[:review])
    end

    def review_params
      params.require(:review).permit(:review_description, :anime_id, :user_id)
    end

    def create_real_time
      # ActionCable.server.broadcast "comments",
      #   comment_id: @comment.id,
      #   content: @comment.content,
      #   email: current_user.email,
      #   time: Time.now.to_i - @comment.created_at.to_i
      # head :ok
    end
end
