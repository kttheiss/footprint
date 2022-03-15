require "rails_helper"

RSpec.describe "activity_logs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/activity_logs", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "activity_logs",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ActivityLogResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { ActivityLog.count }.by(1)
    end
  end
end
