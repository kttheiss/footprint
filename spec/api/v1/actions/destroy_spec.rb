require 'rails_helper'

RSpec.describe "actions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/actions/#{action.id}"
  end

  describe 'basic destroy' do
    let!(:action) { create(:action) }

    it 'updates the resource' do
      expect(ActionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Action.count }.by(-1)
      expect { action.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
