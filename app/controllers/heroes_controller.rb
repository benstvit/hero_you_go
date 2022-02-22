class HeroesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
  end

  def edit
  end
end
