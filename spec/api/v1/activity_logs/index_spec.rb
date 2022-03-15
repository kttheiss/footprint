require "rails_helper"

RSpec.describe "activity_logs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_logs", params: params
  end

  describe "basic fetch" do
    let!(:activity_log1) { create(:activity_log) }
    let!(:activity_log2) { create(:activity_log) }

    it "works" do
      expect(ActivityLogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["activity_logs"])
      expect(d.map(&:id)).to match_array([activity_log1.id, activity_log2.id])
    end
  end
end
