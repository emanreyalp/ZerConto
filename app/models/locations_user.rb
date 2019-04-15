class LocationsUser < ApplicationRecord
  belongs_to :user, inverse_of: :locations_user
  belongs_to :location, inverse_of: :locations_user

  validate :max_five_location

  private
    def max_five_location
      return if user.locations.count < 5
      errors.add(:user, 'User has maximum 5 location')
    end
end
