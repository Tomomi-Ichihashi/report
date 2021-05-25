require 'test_helper'

class Users::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_informations_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_informations_index_url
    assert_response :success
  end

  test "should get new" do
    get users_informations_new_url
    assert_response :success
  end

  test "should get show" do
    get users_informations_show_url
    assert_response :success
  end

end
