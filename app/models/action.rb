class Action < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :impact_level, :inclusion => { :in => [ "low", "medium", "high" ]  }

  validates :impact_level_value, :inclusion => { :in => [ "1", "2", "3" ]  }

  # Scopes

  def to_s
    date
  end

end
