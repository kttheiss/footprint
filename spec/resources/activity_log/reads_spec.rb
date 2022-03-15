require "rails_helper"

RSpec.describe ActivityLogResource, type: :resource do
  describe "serialization" do
    let!(:activity_log) { create(:activity_log) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activity_log.id)
      expect(data.jsonapi_type).to eq("activity_logs")
    end
  end

  describe "filtering" do
    let!(:activity_log1) { create(:activity_log) }
    let!(:activity_log2) { create(:activity_log) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: activity_log2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([activity_log2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:activity_log1) { create(:activity_log) }
      let!(:activity_log2) { create(:activity_log) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activity_log1.id,
                                      activity_log2.id,
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
                                      activity_log2.id,
                                      activity_log1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
