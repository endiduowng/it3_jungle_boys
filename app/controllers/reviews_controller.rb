class ReviewsController < ApplicationController
  before_action :find_anime, only: [:review, :create]

  def create
    byebug
    @review = current_user.reviews.new review_params
    byebug
    if @review.save
      create_real_time
    else
      flash[:danger] = "Something is wrong"
      redirect_to root_path
    end
  end

  def review; end

  private
    def find_anime
      @review = Anime.find(params[:review])
    end

    def review_params
      params.require(:review).permit :review_description, :anime_id, :user_id
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