require "rails_helper"

RSpec.describe "activity_logs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_logs/#{activity_log.id}", params: params
  end

  describe "basic fetch" do
    let!(:activity_log) { create(:activity_log) }

    it "works" do
      expect(ActivityLogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("activity_logs")
      expect(d.id).to eq(activity_log.id)
    end
  end
end
