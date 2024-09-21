require "application_system_test_case"

class GravuresTest < ApplicationSystemTestCase
  setup do
    @gravure = gravures(:one)
  end

  test "visiting the index" do
    visit gravures_url
    assert_selector "h1", text: "Gravures"
  end

  test "should create gravure" do
    visit gravures_url
    click_on "New gravure"

    fill_in "Date", with: @gravure.date
    fill_in "High", with: @gravure.high
    fill_in "Low", with: @gravure.low
    fill_in "Time", with: @gravure.time
    click_on "Create Gravure"

    assert_text "Gravure was successfully created"
    click_on "Back"
  end

  test "should update Gravure" do
    visit gravure_url(@gravure)
    click_on "Edit this gravure", match: :first

    fill_in "Date", with: @gravure.date
    fill_in "High", with: @gravure.high
    fill_in "Low", with: @gravure.low
    fill_in "Time", with: @gravure.time
    click_on "Update Gravure"

    assert_text "Gravure was successfully updated"
    click_on "Back"
  end

  test "should destroy Gravure" do
    visit gravure_url(@gravure)
    click_on "Destroy this gravure", match: :first

    assert_text "Gravure was successfully destroyed"
  end
end
