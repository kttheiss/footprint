class ActionsController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]

  # GET /actions
  def index
    @actions = Action.all
  end

  # GET /actions/1
  def show
  end

  # GET /actions/new
  def new
    @action = Action.new
  end

  # GET /actions/1/edit
  def edit
  end

  # POST /actions
  def create
    @action = Action.new(action_params)

    if @action.save
      message = 'Action was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
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
      redirect_to @action, notice: 'Action was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /actions/1
  def destroy
    @action.destroy
    message = "Action was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to actions_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action
      @action = Action.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def action_params
      params.require(:action).permit(:date, :name, :category_id, :impact_level_value, :impact_level, :user_id, :description)
    end
end
