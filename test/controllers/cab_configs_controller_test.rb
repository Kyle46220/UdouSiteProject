require 'test_helper'

class CabConfigsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cab_configs_index_url
    assert_response :success
  end

  test "should get show" do
    get cab_configs_show_url
    assert_response :success
  end

  test "should get create" do
    get cab_configs_create_url
    assert_response :success
  end

  test "should get new" do
    get cab_configs_new_url
    assert_response :success
  end

  test "should get edit" do
    get cab_configs_edit_url
    assert_response :success
  end

  test "should get update" do
    get cab_configs_update_url
    assert_response :success
  end

end
