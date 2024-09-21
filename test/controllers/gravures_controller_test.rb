require "test_helper"

class GravuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gravure = gravures(:one)
  end

  test "should get index" do
    get gravures_url
    assert_response :success
  end

  test "should get new" do
    get new_gravure_url
    assert_response :success
  end

  test "should create gravure" do
    assert_difference("Gravure.count") do
      post gravures_url, params: { gravure: { date: @gravure.date, high: @gravure.high, low: @gravure.low, time: @gravure.time } }
    end

    assert_redirected_to gravure_url(Gravure.last)
  end

  test "should show gravure" do
    get gravure_url(@gravure)
    assert_response :success
  end

  test "should get edit" do
    get edit_gravure_url(@gravure)
    assert_response :success
  end

  test "should update gravure" do
    patch gravure_url(@gravure), params: { gravure: { date: @gravure.date, high: @gravure.high, low: @gravure.low, time: @gravure.time } }
    assert_redirected_to gravure_url(@gravure)
  end

  test "should destroy gravure" do
    assert_difference("Gravure.count", -1) do
      delete gravure_url(@gravure)
    end

    assert_redirected_to gravures_url
  end
end
