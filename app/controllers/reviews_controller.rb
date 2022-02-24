class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @hero = Hero.find(params[:hero_id])
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @review = Review.new(review_params)
    @review.hero_id = @hero
    @review.save
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
