class FootprintTalliesController < ApplicationController
  before_action :set_footprint_tally, only: %i[show edit update destroy]

  def index
    @q = FootprintTally.ransack(params[:q])
    @footprint_tallies = @q.result(distinct: true).includes(:actions,
                                                            :users).page(params[:page]).per(10)
  end

  def show
    @action = Action.new
  end

  def new
    @footprint_tally = FootprintTally.new
  end

  def edit; end

  def create
    @footprint_tally = FootprintTally.new(footprint_tally_params)

    if @footprint_tally.save
      redirect_to @footprint_tally,
                  notice: "Footprint tally was successfully created."
    else
      render :new
    end
  end

  def update
    if @footprint_tally.update(footprint_tally_params)
      redirect_to @footprint_tally,
                  notice: "Footprint tally was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @footprint_tally.destroy
    redirect_to footprint_tallies_url,
                notice: "Footprint tally was successfully destroyed."
  end

  private

  def set_footprint_tally
    @footprint_tally = FootprintTally.find(params[:id])
  end

  def footprint_tally_params
    params.require(:footprint_tally).permit(:footprint_level_word,
                                            :footprint_level_number)
  end
end
