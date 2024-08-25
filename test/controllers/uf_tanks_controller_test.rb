require "test_helper"

class UfTanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uf_tank = uf_tanks(:one)
  end

  test "should get index" do
    get uf_tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_uf_tank_url
    assert_response :success
  end

  test "should create uf_tank" do
    assert_difference("UfTank.count") do
      post uf_tanks_url, params: { uf_tank: { date: @uf_tank.date, density: @uf_tank.density, initial_temp: @uf_tank.initial_temp, ph: @uf_tank.ph, reaction_time: @uf_tank.reaction_time, solid_content: @uf_tank.solid_content, tank_number: @uf_tank.tank_number, viscosity: @uf_tank.viscosity } }
    end

    assert_redirected_to uf_tank_url(UfTank.last)
  end

  test "should show uf_tank" do
    get uf_tank_url(@uf_tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_uf_tank_url(@uf_tank)
    assert_response :success
  end

  test "should update uf_tank" do
    patch uf_tank_url(@uf_tank), params: { uf_tank: { date: @uf_tank.date, density: @uf_tank.density, initial_temp: @uf_tank.initial_temp, ph: @uf_tank.ph, reaction_time: @uf_tank.reaction_time, solid_content: @uf_tank.solid_content, tank_number: @uf_tank.tank_number, viscosity: @uf_tank.viscosity } }
    assert_redirected_to uf_tank_url(@uf_tank)
  end

  test "should destroy uf_tank" do
    assert_difference("UfTank.count", -1) do
      delete uf_tank_url(@uf_tank)
    end

    assert_redirected_to uf_tanks_url
  end
end
