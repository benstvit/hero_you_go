class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top_heros = Hero.where(rating: 5)
    @heros = Hero.all
  end

  def dashboard
  end
end
