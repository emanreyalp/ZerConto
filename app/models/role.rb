class Role < ApplicationRecord
  has_many :users_role, inverse_of: :role
  has_many :users, through: :users_role, dependent: :destroy
end
