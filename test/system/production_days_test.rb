require "application_system_test_case"

class ProductionDaysTest < ApplicationSystemTestCase
  setup do
    @production_day = production_days(:one)
  end

  test "visiting the index" do
    visit production_days_url
    assert_selector "h1", text: "Production days"
  end

  test "should create production day" do
    visit production_days_url
    click_on "New production day"

    fill_in "Approved pallets count", with: @production_day.approved_pallets_count
    fill_in "Info", with: @production_day.info
    fill_in "Production date", with: @production_day.production_date
    fill_in "Stopped pallets count", with: @production_day.stopped_pallets_count
    click_on "Create Production day"

    assert_text "Production day was successfully created"
    click_on "Back"
  end

  test "should update Production day" do
    visit production_day_url(@production_day)
    click_on "Edit this production day", match: :first

    fill_in "Approved pallets count", with: @production_day.approved_pallets_count
    fill_in "Info", with: @production_day.info
    fill_in "Production date", with: @production_day.production_date
    fill_in "Stopped pallets count", with: @production_day.stopped_pallets_count
    click_on "Update Production day"

    assert_text "Production day was successfully updated"
    click_on "Back"
  end

  test "should destroy Production day" do
    visit production_day_url(@production_day)
    click_on "Destroy this production day", match: :first

    assert_text "Production day was successfully destroyed"
  end
end
