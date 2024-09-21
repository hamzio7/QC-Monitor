require "application_system_test_case"

class OvensTest < ApplicationSystemTestCase
  setup do
    @oven = ovens(:one)
  end

  test "visiting the index" do
    visit ovens_url
    assert_selector "h1", text: "Ovens"
  end

  test "should create oven" do
    visit ovens_url
    click_on "New oven"

    fill_in "Date", with: @oven.date
    fill_in "Line number", with: @oven.line_number
    fill_in "Oven 1", with: @oven.oven_1
    fill_in "Oven 10", with: @oven.oven_10
    fill_in "Oven 11", with: @oven.oven_11
    fill_in "Oven 2", with: @oven.oven_2
    fill_in "Oven 3", with: @oven.oven_3
    fill_in "Oven 4", with: @oven.oven_4
    fill_in "Oven 5", with: @oven.oven_5
    fill_in "Oven 6", with: @oven.oven_6
    fill_in "Oven 7", with: @oven.oven_7
    fill_in "Oven 8", with: @oven.oven_8
    fill_in "Oven 9", with: @oven.oven_9
    fill_in "Time", with: @oven.time
    click_on "Create Oven"

    assert_text "Oven was successfully created"
    click_on "Back"
  end

  test "should update Oven" do
    visit oven_url(@oven)
    click_on "Edit this oven", match: :first

    fill_in "Date", with: @oven.date
    fill_in "Line number", with: @oven.line_number
    fill_in "Oven 1", with: @oven.oven_1
    fill_in "Oven 10", with: @oven.oven_10
    fill_in "Oven 11", with: @oven.oven_11
    fill_in "Oven 2", with: @oven.oven_2
    fill_in "Oven 3", with: @oven.oven_3
    fill_in "Oven 4", with: @oven.oven_4
    fill_in "Oven 5", with: @oven.oven_5
    fill_in "Oven 6", with: @oven.oven_6
    fill_in "Oven 7", with: @oven.oven_7
    fill_in "Oven 8", with: @oven.oven_8
    fill_in "Oven 9", with: @oven.oven_9
    fill_in "Time", with: @oven.time
    click_on "Update Oven"

    assert_text "Oven was successfully updated"
    click_on "Back"
  end

  test "should destroy Oven" do
    visit oven_url(@oven)
    click_on "Destroy this oven", match: :first

    assert_text "Oven was successfully destroyed"
  end
end
