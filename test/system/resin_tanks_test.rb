require "application_system_test_case"

class ResinTanksTest < ApplicationSystemTestCase
  setup do
    @resin_tank = resin_tanks(:one)
  end

  test "visiting the index" do
    visit resin_tanks_url
    assert_selector "h1", text: "Resin tanks"
  end

  test "should create resin tank" do
    visit resin_tanks_url
    click_on "New resin tank"

    fill_in "Density", with: @resin_tank.density
    fill_in "Initial temp", with: @resin_tank.initial_temp
    fill_in "Ph", with: @resin_tank.ph
    fill_in "Reaction time", with: @resin_tank.reaction_time
    fill_in "Solid content", with: @resin_tank.solid_content
    fill_in "Tank number", with: @resin_tank.tank_number
    fill_in "Viscosity", with: @resin_tank.viscosity
    click_on "Create Resin tank"

    assert_text "Resin tank was successfully created"
    click_on "Back"
  end

  test "should update Resin tank" do
    visit resin_tank_url(@resin_tank)
    click_on "Edit this resin tank", match: :first

    fill_in "Density", with: @resin_tank.density
    fill_in "Initial temp", with: @resin_tank.initial_temp
    fill_in "Ph", with: @resin_tank.ph
    fill_in "Reaction time", with: @resin_tank.reaction_time
    fill_in "Solid content", with: @resin_tank.solid_content
    fill_in "Tank number", with: @resin_tank.tank_number
    fill_in "Viscosity", with: @resin_tank.viscosity
    click_on "Update Resin tank"

    assert_text "Resin tank was successfully updated"
    click_on "Back"
  end

  test "should destroy Resin tank" do
    visit resin_tank_url(@resin_tank)
    click_on "Destroy this resin tank", match: :first

    assert_text "Resin tank was successfully destroyed"
  end
end
