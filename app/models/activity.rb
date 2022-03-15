class Activity < ApplicationRecord
  # Direct associations

  belongs_to :impact_level,
             class_name: "FootprintTally",
             foreign_key: "footprint_level_id"

  belongs_to :category

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    date
  end
end
