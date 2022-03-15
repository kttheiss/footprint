class ActivityLogsController < ApplicationController
  before_action :current_user_must_be_activity_log_user,
                only: %i[edit update destroy]

  before_action :set_activity_log, only: %i[show edit update destroy]

  def index
    @q = ActivityLog.ransack(params[:q])
    @activity_logs = @q.result(distinct: true).includes(:user,
                                                        :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @activity_log = ActivityLog.new
  end

  def edit; end

  def create
    @activity_log = ActivityLog.new(activity_log_params)

    if @activity_log.save
      message = "ActivityLog was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @activity_log, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @activity_log.update(activity_log_params)
      redirect_to @activity_log,
                  notice: "Activity log was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @activity_log.destroy
    message = "ActivityLog was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to activity_logs_url, notice: message
    end
  end

  private

  def current_user_must_be_activity_log_user
    set_activity_log
    unless current_user == @activity_log.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_activity_log
    @activity_log = ActivityLog.find(params[:id])
  end

  def activity_log_params
    params.require(:activity_log).permit(:name, :date, :category_id,
                                         :user_id, :description, :footprint, :footprint_number)
  end
end
