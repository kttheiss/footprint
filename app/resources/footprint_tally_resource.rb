class FootprintTallyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :footprint_level_word, :string
  attribute :footprint_level_number, :integer

  # Direct associations

  has_many   :actions,
             foreign_key: :footprint_level_id

  # Indirect associations

  many_to_many :users
end
