require "rails_helper"

RSpec.describe FootprintTallyResource, type: :resource do
  describe "serialization" do
    let!(:footprint_tally) { create(:footprint_tally) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(footprint_tally.id)
      expect(data.jsonapi_type).to eq("footprint_tallies")
    end
  end

  describe "filtering" do
    let!(:footprint_tally1) { create(:footprint_tally) }
    let!(:footprint_tally2) { create(:footprint_tally) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: footprint_tally2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([footprint_tally2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:footprint_tally1) { create(:footprint_tally) }
      let!(:footprint_tally2) { create(:footprint_tally) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      footprint_tally1.id,
                                      footprint_tally2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      footprint_tally2.id,
                                      footprint_tally1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
