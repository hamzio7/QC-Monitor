require "test_helper"

class ProductionDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_day = production_days(:one)
  end

  test "should get index" do
    get production_days_url
    assert_response :success
  end

  test "should get new" do
    get new_production_day_url
    assert_response :success
  end

  test "should create production_day" do
    assert_difference("ProductionDay.count") do
      post production_days_url, params: { production_day: { approved_pallets_count: @production_day.approved_pallets_count, info: @production_day.info, production_date: @production_day.production_date, stopped_pallets_count: @production_day.stopped_pallets_count } }
    end

    assert_redirected_to production_day_url(ProductionDay.last)
  end

  test "should show production_day" do
    get production_day_url(@production_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_day_url(@production_day)
    assert_response :success
  end

  test "should update production_day" do
    patch production_day_url(@production_day), params: { production_day: { approved_pallets_count: @production_day.approved_pallets_count, info: @production_day.info, production_date: @production_day.production_date, stopped_pallets_count: @production_day.stopped_pallets_count } }
    assert_redirected_to production_day_url(@production_day)
  end

  test "should destroy production_day" do
    assert_difference("ProductionDay.count", -1) do
      delete production_day_url(@production_day)
    end

    assert_redirected_to production_days_url
  end
end
