class HerosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    raise
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render :new
    end
  end

  def edit
  end

  def hero_params
    params.require(:hero).permit(:name, :location, :price, :users_id)
  end
end
