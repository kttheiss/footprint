require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:actions) }
  end

  describe "InDirect Associations" do
    it { should have_many(:impact_levels) }
  end

  describe "Validations" do
  end
end
