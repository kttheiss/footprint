require 'rails_helper'

RSpec.describe Action, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:impact_level_value).in_array([ "1", "2", "3" ]) }

    end
end
