class UsersRole < ApplicationRecord
  belongs_to :user, inverse_of: :users_role
  belongs_to :role, inverse_of: :users_role
end
