require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get pawns" do
    get pages_pawns_url
    assert_response :success
  end

  test "should get layaway" do
    get pages_layaway_url
    assert_response :success
  end

  test "should get inventory" do
    get pages_inventory_url
    assert_response :success
  end

  test "should get biker" do
    get pages_biker_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

end
