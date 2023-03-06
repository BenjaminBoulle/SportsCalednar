class WalkingsController < ApplicationController
  def index
    @walkings = Walking.where(activity_list: params[:activity_list_id]).order(date: :desc).order(name: :desc)
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def show
    @walking = Walking.find(params[:id])
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def new
    @activity_list = ActivityList.where(user: current_user).first
    @walking = Walking.new
  end

  def create
    @walking = Walking.new(walking_params)
    @walking.activity_list = ActivityList.where(user: current_user).first
    @walking.time = (params[:walking][:hours].to_i * 3600) + (params[:walking][:minutes].to_i * 60) + params[:walking][:seconds].to_i
    @walking.avg_speed = ((params[:walking][:distance].to_f / @walking.time) * 3600).round(1)
    @walking.avg_pace = (@walking.time / params[:walking][:distance].to_f).floor
    # @walking.distance = "#{params[:walking][:distance]} km"
    # if params[:walking][:average_pace] == ""
    #   average_pace = 60.0 / params[:walking][:average_speed].to_i
    #   average_min = average_pace.floor
    #   average_sec = ((average_pace - average_min) * 60).round
    #   @walking.average_pace = "#{average_min}min #{average_sec}sec /km"
    # end
    # @walking.average_speed = "#{params[:walking][:average_speed]} km/h"
    # # @walking.average_pace = "#{params[:walking][:average_pace]} min/km"
    # @walking.max_speed = "#{params[:walking][:max_speed]} km/h"
    if @walking.save
      if @walking.photo.attached? == false
        @walking.photo.attach(io: URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677961936/1000_F_437015568_nCpUsxa0tLt5V6A9DTm4bv26Gldqt4AX_rtlegk.jpg"), filename: "walking.jpg", content_type: "image/jpg")
      end
      redirect_to activity_list_walkings_path(@walking.activity_list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @activity_list = ActivityList.where(user: current_user).first
    @walking = Walking.find(params[:id])
  end

  def update
    @walking = Walking.find(params[:id])
    @walking.time = (params[:walking][:hours].to_i * 3600) + (params[:walking][:minutes].to_i * 60) + params[:walking][:seconds].to_i
    @walking.avg_speed = ((params[:walking][:distance].to_f / @walking.time) * 3600).round(1)
    @walking.avg_pace = (@walking.time / params[:walking][:distance].to_f).floor
    @walking.update(walking_params)
    redirect_to activity_list_walkings_path(@walking.activity_list)
  end

  def destroy
    activity_list = ActivityList.where(user: current_user).first
    @walking = Walking.find(params[:id])
    @walking.destroy
    redirect_to activity_list_path(activity_list), status: :see_other
  end

  private

  def walking_params
    params.require(:walking).permit(:name,
                                    :distance,
                                    :avg_speed,
                                    :avg_pace,
                                    :max_speed,
                                    :avg_heart_rate,
                                    :max_heart_rate,
                                    :friends,
                                    :date,
                                    :time,
                                    :elevation_gain,
                                    :photo)
  end
end
