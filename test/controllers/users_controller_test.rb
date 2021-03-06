require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { first_name: @user.first_name, last_name: @user.last_name, superior_id: @user.superior_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { first_name: @user.first_name, last_name: @user.last_name, superior_id: @user.superior_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    user = create(:user)

    assert_difference('User.count', -1) do
      delete user_url(user)
    end

    assert_redirected_to users_url
  end

  test "shouldn't destroy a user if it has employee" do
    user = create(:user, :with_employee)

    assert_no_difference('User.count') do
      delete user_url(user)
    end

    assert_redirected_to users_url
  end
end
