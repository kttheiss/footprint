class FootprintTally < ApplicationRecord
  # Direct associations

  has_many   :actions,
             foreign_key: "footprint_level_id",
             dependent: :destroy

  # Indirect associations

  has_many   :users,
             through: :actions,
             source: :user

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
