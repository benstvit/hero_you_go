class HerosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @heros = Hero.where("power ILIKE ?", "%#{params[:query]}%")
    else
      @heros = Hero.all
    end
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
    @hero = Hero.new
  end

  def create
    power_ids = params[:hero][:powers]
    @hero = Hero.new(
      name: params[:hero][:name],
      location: params[:hero][:location],
      price: params[:hero][:price],
      photo: params[:hero][:photo]
    )
    @hero.user = current_user

    if @hero.save
      power_ids.each do |power_id|
        power = Power.find(power_id)
        # HeroPower.create(hero: @hero, power: power)
        @hero.powers << power
      end
      redirect_to hero_path(@hero)
    else
      render :new
    end
  end

  def edit
  end

  # def hero_params
  #   params.require(:hero).permit(:name, :location, :price, powers: [])
  # end
end
