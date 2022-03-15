require "rails_helper"

RSpec.describe "activity_logs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activity_logs/#{activity_log.id}", payload
  end

  describe "basic update" do
    let!(:activity_log) { create(:activity_log) }

    let(:payload) do
      {
        data: {
          id: activity_log.id.to_s,
          type: "activity_logs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ActivityLogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { activity_log.reload.attributes }
    end
  end
end
