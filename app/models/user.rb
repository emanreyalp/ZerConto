class User < ApplicationRecord
  belongs_to :superior, class_name: :User, optional: true
  has_many :employees, class_name: :User, foreign_key: :superior_id
  has_many :locations_user, inverse_of: :user
  has_many :locations, through: :locations_user, dependent: :destroy
  has_many :users_role, inverse_of: :user
  has_many :roles, through: :users_role, dependent: :destroy

  validate :itself_superior
  validate :one_of_its_superiors

  before_destroy :has_employee

  def has_role?(role)
    roles.pluck(:name).include? role
  end

  def decorated_roles
    roles.pluck(:name).join(', ')
  end

  def potential_superiors
    excluded_ids = [id]
    excluded_ids.concat(employee_chain_ids)
    User.joins(:roles).where(roles: { name: 'manager' }).where.not(id: excluded_ids)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  protected

    def employee_chain_ids
      ids = []

      employees.each do |employee|
        ids << employee.id
        ids.concat(employee.employee_chain_ids)
      end

      return ids
    end

  private

    def has_employee
      return if employees.empty?

      errors.add :user, 'Cannot delete user with employee'
      throw(:abort)
    end

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
