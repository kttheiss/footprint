require "rails_helper"

RSpec.describe "activity_logs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activity_logs/#{activity_log.id}"
  end

  describe "basic destroy" do
    let!(:activity_log) { create(:activity_log) }

    it "updates the resource" do
      expect(ActivityLogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ActivityLog.count }.by(-1)
      expect { activity_log.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
