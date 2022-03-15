require "rails_helper"

RSpec.describe "footprint_tallies#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/footprint_tallies/#{footprint_tally.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:footprint_tally) { create(:footprint_tally) }

    it "works" do
      expect(FootprintTallyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("footprint_tallies")
      expect(d.id).to eq(footprint_tally.id)
    end
  end
end
