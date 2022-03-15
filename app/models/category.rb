class Category < ApplicationRecord
  # Direct associations

  has_many   :actions,
             class_name: "Activity",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
