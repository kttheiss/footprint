require "rails_helper"

RSpec.describe FootprintTally, type: :model do
  describe "Direct Associations" do
    it { should have_many(:actions) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users) }
  end

  describe "Validations" do
  end
end
