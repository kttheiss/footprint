require "rails_helper"

RSpec.describe "footprint_tallies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/footprint_tallies/#{footprint_tally.id}"
  end

  describe "basic destroy" do
    let!(:footprint_tally) { create(:footprint_tally) }

    it "updates the resource" do
      expect(FootprintTallyResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { FootprintTally.count }.by(-1)
      expect { footprint_tally.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
