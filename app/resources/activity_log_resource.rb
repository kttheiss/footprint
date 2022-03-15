class ActivityLogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :date, :date
  attribute :category_id, :integer
  attribute :user_id, :integer
  attribute :description, :string
  attribute :footprint, :string
  attribute :footprint_number, :integer

  # Direct associations

  belongs_to :category

  belongs_to :user

  # Indirect associations
end
