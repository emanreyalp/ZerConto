require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user has max 5 location' do
    user = create(:user, :with_five_location)
    sixth_location = create(:location)

    assert_equal user.locations.count, 5

    assert_raises(ActiveRecord::RecordInvalid) do
      user.locations << sixth_location
    end
  end

  test 'User cannot be its own superior' do
    user = create(:user)

    assert_raises(ActiveRecord::RecordInvalid) do
      user.superior = user
      user.save!
    end
  end

  test 'User cannot be its superior`s superior' do
    user = create(:user, :with_employee)

    assert_raises(ActiveRecord::RecordInvalid) do
      user.superior = user.employees.first
      user.save!
    end
  end
end
