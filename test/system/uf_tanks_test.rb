require "application_system_test_case"

class UfTanksTest < ApplicationSystemTestCase
  setup do
    @uf_tank = uf_tanks(:one)
  end

  test "visiting the index" do
    visit uf_tanks_url
    assert_selector "h1", text: "Uf tanks"
  end

  test "should create uf tank" do
    visit uf_tanks_url
    click_on "New uf tank"

    fill_in "Date", with: @uf_tank.date
    fill_in "Density", with: @uf_tank.density
    fill_in "Initial temp", with: @uf_tank.initial_temp
    fill_in "Ph", with: @uf_tank.ph
    fill_in "Reaction time", with: @uf_tank.reaction_time
    fill_in "Tank number", with: @uf_tank.tank_number
    fill_in "Viscosity", with: @uf_tank.viscosity
    click_on "Create Uf tank"

    assert_text "Uf tank was successfully created"
    click_on "Back"
  end

  test "should update Uf tank" do
    visit uf_tank_url(@uf_tank)
    click_on "Edit this uf tank", match: :first

    fill_in "Date", with: @uf_tank.date
    fill_in "Density", with: @uf_tank.density
    fill_in "Initial temp", with: @uf_tank.initial_temp
    fill_in "Ph", with: @uf_tank.ph
    fill_in "Reaction time", with: @uf_tank.reaction_time
    fill_in "Tank number", with: @uf_tank.tank_number
    fill_in "Viscosity", with: @uf_tank.viscosity
    click_on "Update Uf tank"

    assert_text "Uf tank was successfully updated"
    click_on "Back"
  end

  test "should destroy Uf tank" do
    visit uf_tank_url(@uf_tank)
    click_on "Destroy this uf tank", match: :first

    assert_text "Uf tank was successfully destroyed"
  end
end
