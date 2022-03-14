class ActionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :date, :date
  attribute :name, :string
  attribute :category_id, :integer
  attribute :impact_level_value, :integer
  attribute :impact_level, :string
  attribute :user_id, :integer
  attribute :description, :string

  # Direct associations

  belongs_to :user

  # Indirect associations

end
