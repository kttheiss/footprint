require "rails_helper"

RSpec.describe FootprintTallyResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "footprint_tallies",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FootprintTallyResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { FootprintTally.count }.by(1)
    end
  end

  describe "updating" do
    let!(:footprint_tally) { create(:footprint_tally) }

    let(:payload) do
      {
        data: {
          id: footprint_tally.id.to_s,
          type: "footprint_tallies",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FootprintTallyResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { footprint_tally.reload.updated_at }
      # .and change { footprint_tally.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:footprint_tally) { create(:footprint_tally) }

    let(:instance) do
      FootprintTallyResource.find(id: footprint_tally.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { FootprintTally.count }.by(-1)
    end
  end
end
