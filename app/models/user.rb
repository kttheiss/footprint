class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :actions,
             dependent: :destroy

  # Indirect associations

  has_many   :impact_levels,
             through: :actions,
             source: :impact_level

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
