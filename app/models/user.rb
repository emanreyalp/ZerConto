class User < ApplicationRecord
  belongs_to :superior, class_name: :User, optional: true
  has_many :employees, class_name: :User, foreign_key: :superior_id
  has_many :locations_user, inverse_of: :user
  has_many :locations, through: :locations_user, dependent: :destroy
  has_many :users_role, inverse_of: :user
  has_many :roles, through: :users_role, dependent: :destroy

  validate :itself_superior
  validate :one_of_its_superiors

  def has_role?(role)
    roles.pluck(:name).include? role
  end

  def decorated_roles
    roles.pluck(:name).join(', ')
  end

  private
    def superior_chain_ids
      superior_ids = []
      user = self

      # We don't want to run an infinite loop :)
      until user.superior_id.nil? || superior_ids.include?(user.superior_id)
        superior_ids << user.superior_id
        user = user.superior
      end

      superior_ids
    end

    def itself_superior
      return if superior_id != id || new_record?

      errors.add(:user, 'cannot be its own superior')
    end

    def one_of_its_superiors
      return unless superior_chain_ids.include? id

      errors.add(:user, 'cannot be a superior from one of its superiors')
    end
end
