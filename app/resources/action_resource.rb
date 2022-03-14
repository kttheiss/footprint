class ActionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :date, :date
  attribute :name, :string
  attribute :category_id, :integer
  attribute :user_id, :integer
  attribute :description, :string
  attribute :footprint_level_id, :integer

  # Direct associations

  belongs_to :impact_level,
             resource: FootprintTallyResource,
             foreign_key: :footprint_level_id

  belongs_to :category

  belongs_to :user

  # Indirect associations
end
