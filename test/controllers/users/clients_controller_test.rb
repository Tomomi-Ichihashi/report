require 'test_helper'

class Users::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_clients_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_clients_index_url
    assert_response :success
  end

  test "should get new" do
    get users_clients_new_url
    assert_response :success
  end

  test "should get show" do
    get users_clients_show_url
    assert_response :success
  end

end
