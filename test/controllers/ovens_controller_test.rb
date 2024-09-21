require "test_helper"

class OvensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oven = ovens(:one)
  end

  test "should get index" do
    get ovens_url
    assert_response :success
  end

  test "should get new" do
    get new_oven_url
    assert_response :success
  end

  test "should create oven" do
    assert_difference("Oven.count") do
      post ovens_url, params: { oven: { date: @oven.date, line_number: @oven.line_number, oven_1: @oven.oven_1, oven_10: @oven.oven_10, oven_11: @oven.oven_11, oven_2: @oven.oven_2, oven_3: @oven.oven_3, oven_4: @oven.oven_4, oven_5: @oven.oven_5, oven_6: @oven.oven_6, oven_7: @oven.oven_7, oven_8: @oven.oven_8, oven_9: @oven.oven_9, time: @oven.time } }
    end

    assert_redirected_to oven_url(Oven.last)
  end

  test "should show oven" do
    get oven_url(@oven)
    assert_response :success
  end

  test "should get edit" do
    get edit_oven_url(@oven)
    assert_response :success
  end

  test "should update oven" do
    patch oven_url(@oven), params: { oven: { date: @oven.date, line_number: @oven.line_number, oven_1: @oven.oven_1, oven_10: @oven.oven_10, oven_11: @oven.oven_11, oven_2: @oven.oven_2, oven_3: @oven.oven_3, oven_4: @oven.oven_4, oven_5: @oven.oven_5, oven_6: @oven.oven_6, oven_7: @oven.oven_7, oven_8: @oven.oven_8, oven_9: @oven.oven_9, time: @oven.time } }
    assert_redirected_to oven_url(@oven)
  end

  test "should destroy oven" do
    assert_difference("Oven.count", -1) do
      delete oven_url(@oven)
    end

    assert_redirected_to ovens_url
  end
end
