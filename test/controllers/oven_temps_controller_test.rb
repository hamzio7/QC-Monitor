require "test_helper"

class OvenTempsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oven_temp = oven_temps(:one)
  end

  test "should get index" do
    get oven_temps_url
    assert_response :success
  end

  test "should get new" do
    get new_oven_temp_url
    assert_response :success
  end

  test "should create oven_temp" do
    assert_difference("OvenTemp.count") do
      post oven_temps_url, params: { oven_temp: { oven_number: @oven_temp.oven_number, temperature: @oven_temp.temperature, time: @oven_temp.time } }
    end

    assert_redirected_to oven_temp_url(OvenTemp.last)
  end

  test "should show oven_temp" do
    get oven_temp_url(@oven_temp)
    assert_response :success
  end

  test "should get edit" do
    get edit_oven_temp_url(@oven_temp)
    assert_response :success
  end

  test "should update oven_temp" do
    patch oven_temp_url(@oven_temp), params: { oven_temp: { oven_number: @oven_temp.oven_number, temperature: @oven_temp.temperature, time: @oven_temp.time } }
    assert_redirected_to oven_temp_url(@oven_temp)
  end

  test "should destroy oven_temp" do
    assert_difference("OvenTemp.count", -1) do
      delete oven_temp_url(@oven_temp)
    end

    assert_redirected_to oven_temps_url
  end
end
