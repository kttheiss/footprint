require "rails_helper"

RSpec.describe ActionResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "actions",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActionResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Action.count }.by(1)
    end
  end

  describe "updating" do
    let!(:action) { create(:action) }

    let(:payload) do
      {
        data: {
          id: action.id.to_s,
          type: "actions",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActionResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { action.reload.updated_at }
      # .and change { action.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:action) { create(:action) }

    let(:instance) do
      ActionResource.find(id: action.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Action.count }.by(-1)
    end
  end
end
