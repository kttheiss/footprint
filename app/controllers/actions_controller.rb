class ActionsController < ApplicationController
  before_action :current_user_must_be_action_user,
                only: %i[edit update destroy]

  before_action :set_action, only: %i[show edit update destroy]

  # GET /actions
  def index
    @q = Action.ransack(params[:q])
    @actions = @q.result(distinct: true).includes(:user,
                                                  :category).page(params[:page]).per(10)
  end

  # GET /actions/1
  def show; end

  # GET /actions/new
  def new
    @action = Action.new
  end

  # GET /actions/1/edit
  def edit; end

  # POST /actions
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

  # PATCH/PUT /actions/1
  def update
    if @action.update(action_params)
      redirect_to @action, notice: "Action was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /actions/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_action
    @action = Action.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def action_params
    params.require(:action).permit(:date, :name, :category_id,
                                   :impact_level_value, :impact_level, :user_id, :description)
  end
end
