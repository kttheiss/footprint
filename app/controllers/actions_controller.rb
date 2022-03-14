class ActionsController < ApplicationController
  before_action :current_user_must_be_action_user,
                only: %i[edit update destroy]

  before_action :set_action, only: %i[show edit update destroy]

  def index
    @q = Action.ransack(params[:q])
    @actions = @q.result(distinct: true).includes(:user,
                                                  :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @action = Action.new
  end

  def edit; end

  def create
    @action = Action.new(action_params)

    if @action.save
      message = "Action was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @action, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @action.update(action_params)
      redirect_to @action, notice: "Action was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @action.destroy
    message = "Action was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to actions_url, notice: message
    end
  end

  private

  def current_user_must_be_action_user
    set_action
    unless current_user == @action.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_action
    @action = Action.find(params[:id])
  end

  def action_params
    params.require(:action).permit(:date, :name, :category_id,
                                   :impact_level_value, :impact_level, :user_id, :description)
  end
end
