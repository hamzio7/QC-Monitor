require "application_system_test_case"

class MfTanksTest < ApplicationSystemTestCase
  setup do
    @mf_tank = mf_tanks(:one)
  end

  test "visiting the index" do
    visit mf_tanks_url
    assert_selector "h1", text: "Mf tanks"
  end

  test "should create mf tank" do
    visit mf_tanks_url
    click_on "New mf tank"

    fill_in "Date", with: @mf_tank.date
    fill_in "Density", with: @mf_tank.density
    fill_in "Initial temp", with: @mf_tank.initial_temp
    fill_in "Ph", with: @mf_tank.ph
    fill_in "Reaction time", with: @mf_tank.reaction_time
    fill_in "Tank number", with: @mf_tank.tank_number
    fill_in "Viscosity", with: @mf_tank.viscosity
    click_on "Create Mf tank"

    assert_text "Mf tank was successfully created"
    click_on "Back"
  end

  test "should update Mf tank" do
    visit mf_tank_url(@mf_tank)
    click_on "Edit this mf tank", match: :first

    fill_in "Date", with: @mf_tank.date
    fill_in "Density", with: @mf_tank.density
    fill_in "Initial temp", with: @mf_tank.initial_temp
    fill_in "Ph", with: @mf_tank.ph
    fill_in "Reaction time", with: @mf_tank.reaction_time
    fill_in "Tank number", with: @mf_tank.tank_number
    fill_in "Viscosity", with: @mf_tank.viscosity
    click_on "Update Mf tank"

    assert_text "Mf tank was successfully updated"
    click_on "Back"
  end

  test "should destroy Mf tank" do
    visit mf_tank_url(@mf_tank)
    click_on "Destroy this mf tank", match: :first

    assert_text "Mf tank was successfully destroyed"
  end
end
