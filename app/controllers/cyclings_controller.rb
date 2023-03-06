class CyclingsController < ApplicationController
  def index
    @cyclings = Cycling.where(activity_list: params[:activity_list_id]).order(date: :desc).order(name: :desc)
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def show
    @cycling = Cycling.find(params[:id])
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def new
    @activity_list = ActivityList.where(user: current_user).first
    @cycling = Cycling.new
  end

  def create
    @cycling = Cycling.new(cycling_params)
    @cycling.activity_list = ActivityList.where(user: current_user).first
    @cycling.time = (params[:cycling][:hours].to_i * 3600) + (params[:cycling][:minutes].to_i * 60) + params[:cycling][:seconds].to_i
    @cycling.avg_speed = ((params[:cycling][:distance].to_f / @cycling.time) * 3600).round(1)
    if @cycling.save
      if @cycling.photo.attached? == false
        @cycling.photo.attach(io: URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678099383/20439058_rvslb7.jpg"), filename: "cycling.jpg", content_type: "image/jpg")
      end
      redirect_to activity_list_cyclings_path(@cycling.activity_list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @activity_list = ActivityList.where(user: current_user).first
    @cycling = Cycling.find(params[:id])
  end

  def update
    @cycling = Cycling.find(params[:id])
    @cycling.time = (params[:cycling][:hours].to_i * 3600) + (params[:cycling][:minutes].to_i * 60) + params[:cycling][:seconds].to_i
    @cycling.avg_speed = ((params[:cycling][:distance].to_f / @cycling.time) * 3600).round(1)
    # @cycling.avg_pace = (@cycling.time / params[:cycling][:distance].to_f).floor
    @cycling.update(cycling_params)
    redirect_to activity_list_cyclings_path(@cycling.activity_list)
  end

  def destroy
    activity_list = ActivityList.where(user: current_user).first
    @cycling = Cycling.find(params[:id])
    @cycling.destroy
    redirect_to activity_list_path(activity_list), status: :see_other
  end

  private

  def cycling_params
    params.require(:cycling).permit(:name,
                                    :distance,
                                    :avg_speed,
                                    :max_speed,
                                    :avg_heart_rate,
                                    :max_heart_rate,
                                    :friends,
                                    :date,
                                    :time,
                                    :elevation_gain,
                                    :max_elevation,
                                    :photo)
  end
end
