require "application_system_test_case"

class VolatileContentsTest < ApplicationSystemTestCase
  setup do
    @volatile_content = volatile_contents(:one)
  end

  test "visiting the index" do
    visit volatile_contents_url
    assert_selector "h1", text: "Volatile contents"
  end

  test "should create volatile content" do
    visit volatile_contents_url
    click_on "New volatile content"

    fill_in "Max", with: @volatile_content.max
    fill_in "Min", with: @volatile_content.min
    fill_in "Time", with: @volatile_content.time
    click_on "Create Volatile content"

    assert_text "Volatile content was successfully created"
    click_on "Back"
  end

  test "should update Volatile content" do
    visit volatile_content_url(@volatile_content)
    click_on "Edit this volatile content", match: :first

    fill_in "Max", with: @volatile_content.max
    fill_in "Min", with: @volatile_content.min
    fill_in "Time", with: @volatile_content.time
    click_on "Update Volatile content"

    assert_text "Volatile content was successfully updated"
    click_on "Back"
  end

  test "should destroy Volatile content" do
    visit volatile_content_url(@volatile_content)
    click_on "Destroy this volatile content", match: :first

    assert_text "Volatile content was successfully destroyed"
  end
end
