class Api::V1::ActionsController < Api::V1::GraphitiController
  def index
    actions = ActionResource.all(params)
    respond_with(actions)
  end

  def show
    action = ActionResource.find(params)
    respond_with(action)
  end

  def create
    action = ActionResource.build(params)

    if action.save
      render jsonapi: action, status: 201
    else
      render jsonapi_errors: action
    end
  end

  def update
    action = ActionResource.find(params)

    if action.update_attributes
      render jsonapi: action
    else
      render jsonapi_errors: action
    end
  end

  def destroy
    action = ActionResource.find(params)

    if action.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: action
    end
  end
end
