require "rails_helper"

RSpec.describe "footprint_tallies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/footprint_tallies", params: params
  end

  describe "basic fetch" do
    let!(:footprint_tally1) { create(:footprint_tally) }
    let!(:footprint_tally2) { create(:footprint_tally) }

    it "works" do
      expect(FootprintTallyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["footprint_tallies"])
      expect(d.map(&:id)).to match_array([footprint_tally1.id,
                                          footprint_tally2.id])
    end
  end
end
