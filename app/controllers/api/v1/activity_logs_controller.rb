class Api::V1::ActivityLogsController < Api::V1::GraphitiController
  def index
    activity_logs = ActivityLogResource.all(params)
    respond_with(activity_logs)
  end

  def show
    activity_log = ActivityLogResource.find(params)
    respond_with(activity_log)
  end

  def create
    activity_log = ActivityLogResource.build(params)

    if activity_log.save
      render jsonapi: activity_log, status: :created
    else
      render jsonapi_errors: activity_log
    end
  end

  def update
    activity_log = ActivityLogResource.find(params)

    if activity_log.update_attributes
      render jsonapi: activity_log
    else
      render jsonapi_errors: activity_log
    end
  end

  def destroy
    activity_log = ActivityLogResource.find(params)

    if activity_log.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: activity_log
    end
  end
end
