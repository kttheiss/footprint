require "rails_helper"

RSpec.describe ActionResource, type: :resource do
  describe "serialization" do
    let!(:action) { create(:action) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(action.id)
      expect(data.jsonapi_type).to eq("actions")
    end
  end

  describe "filtering" do
    let!(:action1) { create(:action) }
    let!(:action2) { create(:action) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: action2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([action2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:action1) { create(:action) }
      let!(:action2) { create(:action) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      action1.id,
                                      action2.id,
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
                                      action2.id,
                                      action1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
