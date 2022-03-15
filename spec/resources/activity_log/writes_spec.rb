require "rails_helper"

RSpec.describe ActivityLogResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "activity_logs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActivityLogResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ActivityLog.count }.by(1)
    end
  end

  describe "updating" do
    let!(:activity_log) { create(:activity_log) }

    let(:payload) do
      {
        data: {
          id: activity_log.id.to_s,
          type: "activity_logs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActivityLogResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { activity_log.reload.updated_at }
      # .and change { activity_log.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:activity_log) { create(:activity_log) }

    let(:instance) do
      ActivityLogResource.find(id: activity_log.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ActivityLog.count }.by(-1)
    end
  end
end
