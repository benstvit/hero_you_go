class MissionsController < ApplicationController
  before_action :find_mission, only: %i[edit show edit destroy]
  def new
    @mission = Mission.new
    @hero = Hero.find(params[:hero_id])
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user.id
    @mission.hero_id = @hero.id
    @mission.save
    if @mission.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @mission = Mission.update(mission_params)
    redirect_to dashboard_path
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def destroy
    @mission.destroy
    redirect_to dashboard_path
  end

  private

  def mission_params
    params.require(:mission).permit(:start_date, :end_date, :location, :title, :content)
  end

  def find_mission
    @mission = Mission.find(params[:id])
  end
end
