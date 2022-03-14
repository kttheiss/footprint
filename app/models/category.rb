class Category < ApplicationRecord
  # Direct associations

  has_many   :actions,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
