class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top_reviews = Review.where(rating: 5)
    @heros = Hero.all
  end

  def dashboard
    @mission = Mission.find_by(user_id: current_user)
    @hero = Hero.find_by(user_id: current_user)
  end
end
