require "application_system_test_case"

class OvenTempsTest < ApplicationSystemTestCase
  setup do
    @oven_temp = oven_temps(:one)
  end

  test "visiting the index" do
    visit oven_temps_url
    assert_selector "h1", text: "Oven temps"
  end

  test "should create oven temp" do
    visit oven_temps_url
    click_on "New oven temp"

    fill_in "Oven number", with: @oven_temp.oven_number
    fill_in "Temperature", with: @oven_temp.temperature
    fill_in "Time", with: @oven_temp.time
    click_on "Create Oven temp"

    assert_text "Oven temp was successfully created"
    click_on "Back"
  end

  test "should update Oven temp" do
    visit oven_temp_url(@oven_temp)
    click_on "Edit this oven temp", match: :first

    fill_in "Oven number", with: @oven_temp.oven_number
    fill_in "Temperature", with: @oven_temp.temperature
    fill_in "Time", with: @oven_temp.time
    click_on "Update Oven temp"

    assert_text "Oven temp was successfully updated"
    click_on "Back"
  end

  test "should destroy Oven temp" do
    visit oven_temp_url(@oven_temp)
    click_on "Destroy this oven temp", match: :first

    assert_text "Oven temp was successfully destroyed"
  end
end
