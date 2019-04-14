class Location < ApplicationRecord
  belongs_to :country
  has_one :locations_user, inverse_of: :location, dependent: :destroy
  has_one :user, through: :locations_user, dependent: :destroy
end
