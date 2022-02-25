class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top_reviews = Review.order('rating DESC').first(4)
    @heros = Hero.all
  end

  def dashboard
    @mission = Mission.find_by(user_id: current_user)
    @heros = Hero.where(user_id: current_user)
    @reviews = Review.all
  end
end
