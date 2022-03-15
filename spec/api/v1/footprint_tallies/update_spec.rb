require "rails_helper"

RSpec.describe "footprint_tallies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/footprint_tallies/#{footprint_tally.id}", payload
  end

  describe "basic update" do
    let!(:footprint_tally) { create(:footprint_tally) }

    let(:payload) do
      {
        data: {
          id: footprint_tally.id.to_s,
          type: "footprint_tallies",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FootprintTallyResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { footprint_tally.reload.attributes }
    end
  end
end
