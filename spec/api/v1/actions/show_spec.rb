require "rails_helper"

RSpec.describe "actions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actions/#{action.id}", params: params
  end

  describe "basic fetch" do
    let!(:action) { create(:action) }

    it "works" do
      expect(ActionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("actions")
      expect(d.id).to eq(action.id)
    end
  end
end
