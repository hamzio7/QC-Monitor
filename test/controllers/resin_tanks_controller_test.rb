require "test_helper"

class ResinTanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resin_tank = resin_tanks(:one)
  end

  test "should get index" do
    get resin_tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_resin_tank_url
    assert_response :success
  end

  test "should create resin_tank" do
    assert_difference("ResinTank.count") do
      post resin_tanks_url, params: { resin_tank: { density: @resin_tank.density, initial_temp: @resin_tank.initial_temp, ph: @resin_tank.ph, reaction_time: @resin_tank.reaction_time, solid_content: @resin_tank.solid_content, tank_number: @resin_tank.tank_number, viscosity: @resin_tank.viscosity } }
    end

    assert_redirected_to resin_tank_url(ResinTank.last)
  end

  test "should show resin_tank" do
    get resin_tank_url(@resin_tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_resin_tank_url(@resin_tank)
    assert_response :success
  end

  test "should update resin_tank" do
    patch resin_tank_url(@resin_tank), params: { resin_tank: { density: @resin_tank.density, initial_temp: @resin_tank.initial_temp, ph: @resin_tank.ph, reaction_time: @resin_tank.reaction_time, solid_content: @resin_tank.solid_content, tank_number: @resin_tank.tank_number, viscosity: @resin_tank.viscosity } }
    assert_redirected_to resin_tank_url(@resin_tank)
  end

  test "should destroy resin_tank" do
    assert_difference("ResinTank.count", -1) do
      delete resin_tank_url(@resin_tank)
    end

    assert_redirected_to resin_tanks_url
  end
end
