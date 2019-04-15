class FillRoles < ActiveRecord::Migration[5.2]
  ROLE_NAMES = %w[guest manager developer].freeze

  def up
    ROLE_NAMES.each do |name|
      Role.create(name: name)
    end
  end

  def down
    ROLE_NAMES.each do |name|
      Role.find_by_name(name).destroy
    end
  end
end
