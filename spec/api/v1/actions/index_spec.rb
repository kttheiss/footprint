require "rails_helper"

RSpec.describe "actions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actions", params: params
  end

  describe "basic fetch" do
    let!(:action1) { create(:action) }
    let!(:action2) { create(:action) }

    it "works" do
      expect(ActionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["actions"])
      expect(d.map(&:id)).to match_array([action1.id, action2.id])
    end
  end
end
