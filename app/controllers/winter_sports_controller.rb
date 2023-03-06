class WinterSportsController < ApplicationController
  def index
    @winter_sports = WinterSport.where(activity_list: params[:activity_list_id]).order(date: :desc)
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def show
    @winter_sport = WinterSport.find(params[:id])
    # @activity_list = ActivityList.find(params[:activity_list_id])
    @activity_list = ActivityList.where(user: current_user).first
  end

  def new
    @activity_list = ActivityList.where(user: current_user).first
    @winter_sport = WinterSport.new
  end

  def create
    @winter_sport = WinterSport.new(winter_sport_params)
    @winter_sport.activity_list = ActivityList.where(user: current_user).first
    @winter_sport.time = (params[:winter_sport][:hours].to_i * 3600) + (params[:winter_sport][:minutes].to_i * 60) + params[:winter_sport][:seconds].to_i
    @winter_sport.avg_speed = ((params[:winter_sport][:distance].to_f / @winter_sport.time) * 3600).round(1)
    if @winter_sport.save
      if @winter_sport.photo.attached? == false
        @winter_sport.photo.attach(io: URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678091736/one-continuous-line-drawing-of-young-sporty-man-snowboarder-holding-snowboard-in-alps-snowy-powder-mountain-winter-lifestyle-sport-concept-dynamic-single-line-draw-design-graphic-illustration-vector_pren46.jpg"), filename: "snowboard.jpg", content_type: "image/jpg")
      end
      redirect_to activity_list_winter_sports_path(@winter_sport.activity_list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @activity_list = ActivityList.where(user: current_user).first
    @winter_sport = WinterSport.find(params[:id])
  end

  def update
    @winter_sport = WinterSport.find(params[:id])
    @winter_sport.time = (params[:winter_sport][:hours].to_i * 3600) + (params[:winter_sport][:minutes].to_i * 60) + params[:winter_sport][:seconds].to_i
    @winter_sport.avg_speed = ((params[:winter_sport][:distance].to_f / @winter_sport.time) * 3600).round(1)
    # @winter_sport.avg_pace = (@winter_sport.time / params[:winter_sport][:distance].to_f).floor
    @winter_sport.update(winter_sport_params)
    redirect_to activity_list_winter_sports_path(@winter_sport.activity_list)
  end

  def destroy
    activity_list = ActivityList.where(user: current_user).first
    @winter_sport = WinterSport.find(params[:id])
    @winter_sport.destroy
    redirect_to activity_list_path(activity_list), status: :see_other
  end

  private

  def winter_sport_params
    params.require(:winter_sport).permit(:name,
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
