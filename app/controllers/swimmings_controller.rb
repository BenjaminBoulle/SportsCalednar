require "open-uri"
class SwimmingsController < ApplicationController
  def index
    @swimmings = Swimming.where(activity_list: params[:activity_list_id]).order(date: :desc).order(name: :asc)
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def show
    @swimming = Swimming.find(params[:id])
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def new
    @activity_list = ActivityList.where(user: current_user).first
    @swimming = Swimming.new
  end

  def create
    @swimming = Swimming.new(swimming_params)
    @swimming.activity_list = ActivityList.where(user: current_user).first
    @swimming.time = (params[:swimming][:hours].to_i * 3600) + (params[:swimming][:minutes].to_i * 60) + params[:swimming][:seconds].to_i
    @swimming.avg_speed = ((params[:swimming][:distance].to_f / @swimming.time) * 3600).round(1)
    @swimming.avg_pace = (@swimming.time / (params[:swimming][:distance].to_f * 10)).floor
    if @swimming.save
      if @swimming.photo.attached? == false
        @swimming.photo.attach(io: URI.open(""), filename: "swimming.jpg", content_type: "image/jpg")
      end
      redirect_to activity_list_swimmings_path(@swimming.activity_list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @activity_list = ActivityList.where(user: current_user).first
    @swimming = Swimming.find(params[:id])
  end

  def update
    @swimming = Swimming.find(params[:id])
    @swimming.time = (params[:swimming][:hours].to_i * 3600) + (params[:swimming][:minutes].to_i * 60) + params[:swimming][:seconds].to_i
    @swimming.avg_speed = ((params[:swimming][:distance].to_f / @swimming.time) * 3600).round(1)
    @swimming.avg_pace = (@swimming.time / (params[:swimming][:distance].to_f * 10)).floor
    @swimming.update(swimming_params)
    redirect_to activity_list_swimmings_path(@swimming.activity_list)
  end

  def destroy
    activity_list = ActivityList.where(user: current_user).first
    @swimming = Swimming.find(params[:id])
    @swimming.destroy
    redirect_to activity_list_path(activity_list), status: :see_other
  end

  private

  def swimming_params
    params.require(:swimming).permit(:name,
                                    :distance,
                                    :avg_speed,
                                    :avg_pace,
                                    :max_speed,
                                    :avg_heart_rate,
                                    :max_heart_rate,
                                    :friends,
                                    :date,
                                    :time,
                                    :total_strokes,
                                    :photo)
  end
end
