require "test_helper"

class MfTanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mf_tank = mf_tanks(:one)
  end

  test "should get index" do
    get mf_tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_mf_tank_url
    assert_response :success
  end

  test "should create mf_tank" do
    assert_difference("MfTank.count") do
      post mf_tanks_url, params: { mf_tank: { date: @mf_tank.date, density: @mf_tank.density, initial_temp: @mf_tank.initial_temp, ph: @mf_tank.ph, reaction_time: @mf_tank.reaction_time, tank_number: @mf_tank.tank_number, viscosity: @mf_tank.viscosity } }
    end

    assert_redirected_to mf_tank_url(MfTank.last)
  end

  test "should show mf_tank" do
    get mf_tank_url(@mf_tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_mf_tank_url(@mf_tank)
    assert_response :success
  end

  test "should update mf_tank" do
    patch mf_tank_url(@mf_tank), params: { mf_tank: { date: @mf_tank.date, density: @mf_tank.density, initial_temp: @mf_tank.initial_temp, ph: @mf_tank.ph, reaction_time: @mf_tank.reaction_time, tank_number: @mf_tank.tank_number, viscosity: @mf_tank.viscosity } }
    assert_redirected_to mf_tank_url(@mf_tank)
  end

  test "should destroy mf_tank" do
    assert_difference("MfTank.count", -1) do
      delete mf_tank_url(@mf_tank)
    end

    assert_redirected_to mf_tanks_url
  end
end
