class User < ApplicationRecord
  has_one :superior, class_name: :User
  has_many :employees, class_name: :User, foreign_key: :superior_id
  has_many :locations_user, inverse_of: :user
  has_many :locations, through: :locations_user, dependent: :destroy
  has_many :users_role, inverse_of: :user
  has_many :roles, through: :users_role, dependent: :destroy

  def has_role?(role)
    roles.pluck(:name).include? role
  end

  def decorated_roles
    roles.pluck(:name).join(', ')
  end
end
