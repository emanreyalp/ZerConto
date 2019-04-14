class LocationsUser < ApplicationRecord
  belongs_to :user, inverse_of: :locations_user
  belongs_to :location, inverse_of: :locations_user
end
