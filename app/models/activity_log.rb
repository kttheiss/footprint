class ActivityLog < ApplicationRecord
  # Direct associations

  belongs_to :category

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
