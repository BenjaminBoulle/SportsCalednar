require "open-uri"
class RunningsController < ApplicationController
  def index
    @runnings = Running.where(activity_list: params[:activity_list_id]).order(date: :desc).order(name: :desc)
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def show
    @running = Running.find(params[:id])
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def new
    @activity_list = ActivityList.where(user: current_user).first
    @running = Running.new
  end

  def create
    @running = Running.new(running_params)
    @running.activity_list = ActivityList.where(user: current_user).first
    @running.time = (params[:running][:hours].to_i * 3600) + (params[:running][:minutes].to_i * 60) + params[:running][:seconds].to_i
    @running.avg_speed = ((params[:running][:distance].to_f / @running.time) * 3600).round(1)
    @running.avg_pace = (@running.time / params[:running][:distance].to_f).floor
    if @running.save
      if @running.photo.attached? == false
        @running.photo.attach(io: URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677961936/1000_F_437015568_nCpUsxa0tLt5V6A9DTm4bv26Gldqt4AX_rtlegk.jpg"), filename: "running.jpg", content_type: "image/jpg")
      end
      redirect_to activity_list_runnings_path(@running.activity_list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @activity_list = ActivityList.where(user: current_user).first
    @running = Running.find(params[:id])
  end

  def update
    @running = Running.find(params[:id])
    @running.time = (params[:running][:hours].to_i * 3600) + (params[:running][:minutes].to_i * 60) + params[:running][:seconds].to_i
    @running.avg_speed = ((params[:running][:distance].to_f / @running.time) * 3600).round(1)
    @running.avg_pace = (@running.time / params[:running][:distance].to_f).floor
    @running.update(running_params)
    redirect_to activity_list_runnings_path(@running.activity_list)
  end

  def destroy
    activity_list = ActivityList.where(user: current_user).first
    @running = Running.find(params[:id])
    @running.destroy
    redirect_to activity_list_path(activity_list), status: :see_other
  end

  private

  def running_params
    params.require(:running).permit(:name,
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
