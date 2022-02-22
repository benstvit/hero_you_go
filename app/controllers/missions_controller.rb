class MissionsController < ApplicationController
  def new
    @mission = Mission.new
  end

  def edit
  end

  def show
  end

  private

  def mission_params
    params.require(:mission).permit(:start_date, :end_date, :location, :title, :content, :status)
  end
end
