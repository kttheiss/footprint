require "rails_helper"

RSpec.describe "actions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/actions/#{action.id}", payload
  end

  describe "basic update" do
    let!(:action) { create(:action) }

    let(:payload) do
      {
        data: {
          id: action.id.to_s,
          type: "actions",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ActionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { action.reload.attributes }
    end
  end
end
