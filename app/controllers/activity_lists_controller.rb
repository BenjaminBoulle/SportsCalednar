class ActivityListsController < ApplicationController
  def index
    @activity_list = ActivityList.where(user: current_user)
  end

  def show
    @activity_list = ActivityList.find(params[:id])
    # @activity_list = ActivityList.where(user: current_user).first
    all_activities = []
    @activity_list.runnings.each do |running|
      all_activities << running
    end
    @activity_list.winter_sports.each do |winter_sport|
      all_activities << winter_sport
    end
    @activity_list.cyclings.each do |cycling|
      all_activities << cycling
    end
    @activity_list.swimmings.each do |swimming|
      all_activities << swimming
    end
    @activity_list.walkings.each do |walking|
      all_activities << walking
    end
    @all_activities = all_activities
  end

  def stats
    @activity_list = ActivityList.find(params[:id])
  end
end
