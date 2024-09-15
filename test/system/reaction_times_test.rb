require "application_system_test_case"

class ReactionTimesTest < ApplicationSystemTestCase
  setup do
    @reaction_time = reaction_times(:one)
  end

  test "visiting the index" do
    visit reaction_times_url
    assert_selector "h1", text: "Reaction times"
  end

  test "should create reaction time" do
    visit reaction_times_url
    click_on "New reaction time"

    fill_in "Cloudy time", with: @reaction_time.cloudy_time
    fill_in "Gel time", with: @reaction_time.gel_time
    fill_in "Time", with: @reaction_time.time
    click_on "Create Reaction time"

    assert_text "Reaction time was successfully created"
    click_on "Back"
  end

  test "should update Reaction time" do
    visit reaction_time_url(@reaction_time)
    click_on "Edit this reaction time", match: :first

    fill_in "Cloudy time", with: @reaction_time.cloudy_time
    fill_in "Gel time", with: @reaction_time.gel_time
    fill_in "Time", with: @reaction_time.time
    click_on "Update Reaction time"

    assert_text "Reaction time was successfully updated"
    click_on "Back"
  end

  test "should destroy Reaction time" do
    visit reaction_time_url(@reaction_time)
    click_on "Destroy this reaction time", match: :first

    assert_text "Reaction time was successfully destroyed"
  end
end
