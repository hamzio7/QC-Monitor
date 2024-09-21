require "test_helper"

class PalletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pallet = pallets(:one)
  end

  test "should get index" do
    get pallets_url
    assert_response :success
  end

  test "should get new" do
    get new_pallet_url
    assert_response :success
  end

  test "should create pallet" do
    assert_difference("Pallet.count") do
      post pallets_url, params: { pallet: { cloudy_time: @pallet.cloudy_time, color_number: @pallet.color_number, customer: @pallet.customer, final_grammage_max: @pallet.final_grammage_max, final_grammage_min: @pallet.final_grammage_min, final_info: @pallet.final_info, final_status: @pallet.final_status, final_stop_reason: @pallet.final_stop_reason, final_supervisor: @pallet.final_supervisor, gel_time: @pallet.gel_time, glossiness: @pallet.glossiness, info: @pallet.info, initial_grammage: @pallet.initial_grammage, mf_tank: @pallet.mf_tank, pallet_number: @pallet.pallet_number, date: @pallet.date, time: @pallet.time, quantity: @pallet.quantity, status: @pallet.status, stop_reason: @pallet.stop_reason, supervisor: @pallet.supervisor, uf_tank: @pallet.uf_tank, volatile_content_max: @pallet.volatile_content_max, volatile_content_min: @pallet.volatile_content_min, volatile_content_set_max: @pallet.volatile_content_set_max, volatile_content_set_min: @pallet.volatile_content_set_min } }
    end

    assert_redirected_to pallet_url(Pallet.last)
  end

  test "should show pallet" do
    get pallet_url(@pallet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pallet_url(@pallet)
    assert_response :success
  end

  test "should update pallet" do
    patch pallet_url(@pallet), params: { pallet: { cloudy_time: @pallet.cloudy_time, color_number: @pallet.color_number, customer: @pallet.customer, final_grammage_max: @pallet.final_grammage_max, final_grammage_min: @pallet.final_grammage_min, final_info: @pallet.final_info, final_status: @pallet.final_status, final_stop_reason: @pallet.final_stop_reason, final_supervisor: @pallet.final_supervisor, gel_time: @pallet.gel_time, glossiness: @pallet.glossiness, info: @pallet.info, initial_grammage: @pallet.initial_grammage, mf_tank: @pallet.mf_tank, pallet_number: @pallet.pallet_number, production_date: @pallet.production_date, production_time: @pallet.time, quantity: @pallet.quantity, status: @pallet.status, stop_reason: @pallet.stop_reason, supervisor: @pallet.supervisor, uf_tank: @pallet.uf_tank, volatile_content_max: @pallet.volatile_content_max, volatile_content_min: @pallet.volatile_content_min, volatile_content_set_max: @pallet.volatile_content_set_max, volatile_content_set_min: @pallet.volatile_content_set_min } }
    assert_redirected_to pallet_url(@pallet)
  end

  test "should destroy pallet" do
    assert_difference("Pallet.count", -1) do
      delete pallet_url(@pallet)
    end

    assert_redirected_to pallets_url
  end
end
