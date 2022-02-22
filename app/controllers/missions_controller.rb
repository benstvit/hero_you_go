class MissionsController < ApplicationController
  def new
    @mission = Mission.new
    @hero = Hero.find(params[id])
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user
    @mission.hero_id = @hero
    @mission.save
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:mission_id])
  end

  def update
    @mission = Mission.find(params[:mission_id])
    @mission = Mission.update(mission_params)
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :edit
    end
  end

  def show
    @mission = Mission.find(params[:mission_id])
  end

  private

  def mission_params
    params.require(:mission).permit(:start_date, :end_date, :location, :title, :content, :status)
  end
end
