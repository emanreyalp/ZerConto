class User < ApplicationRecord
  belongs_to :superior, class_name: :User, optional: true
  has_many :employees, class_name: :User, foreign_key: :superior_id
  has_many :locations_user, inverse_of: :user
  has_many :locations, through: :locations_user, dependent: :destroy
  has_many :users_role, inverse_of: :user
  has_many :roles, through: :users_role, dependent: :destroy

  validate :itself_superior

  def has_role?(role)
    roles.pluck(:name).include? role
  end

  def decorated_roles
    roles.pluck(:name).join(', ')
  end

  private
    def itself_superior
      return if superior_id != id || new_record?

      errors.add(:user, 'cannot be its own superior')
    end
end
