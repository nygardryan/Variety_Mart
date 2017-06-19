require 'test_helper'

class PawnsControllerTest < ActionDispatch::IntegrationTest
  test "should get pawn_number:integer" do
    get pawns_pawn_number:integer_url
    assert_response :success
  end

  test "should get start_date:date" do
    get pawns_start_date:date_url
    assert_response :success
  end

  test "should get principle:integer" do
    get pawns_principle:integer_url
    assert_response :success
  end

end
