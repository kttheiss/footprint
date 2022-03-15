class Api::V1::FootprintTalliesController < Api::V1::GraphitiController
  def index
    footprint_tallies = FootprintTallyResource.all(params)
    respond_with(footprint_tallies)
  end

  def show
    footprint_tally = FootprintTallyResource.find(params)
    respond_with(footprint_tally)
  end

  def create
    footprint_tally = FootprintTallyResource.build(params)

    if footprint_tally.save
      render jsonapi: footprint_tally, status: :created
    else
      render jsonapi_errors: footprint_tally
    end
  end

  def update
    footprint_tally = FootprintTallyResource.find(params)

    if footprint_tally.update_attributes
      render jsonapi: footprint_tally
    else
      render jsonapi_errors: footprint_tally
    end
  end

  def destroy
    footprint_tally = FootprintTallyResource.find(params)

    if footprint_tally.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: footprint_tally
    end
  end
end
