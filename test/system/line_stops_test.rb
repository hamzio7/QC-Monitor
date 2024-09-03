require "application_system_test_case"

class LineStopsTest < ApplicationSystemTestCase
  setup do
    @line_stop = line_stops(:one)
  end

  test "visiting the index" do
    visit line_stops_url
    assert_selector "h1", text: "Line stops"
  end

  test "should create line stop" do
    visit line_stops_url
    click_on "New line stop"

    fill_in "Date", with: @line_stop.date
    fill_in "Line number", with: @line_stop.line_number
    fill_in "Reason", with: @line_stop.reason
    fill_in "Shift", with: @line_stop.shift
    fill_in "Time restarted", with: @line_stop.time_restarted
    fill_in "Time stopped", with: @line_stop.time_stopped
    click_on "Create Line stop"

    assert_text "Line stop was successfully created"
    click_on "Back"
  end

  test "should update Line stop" do
    visit line_stop_url(@line_stop)
    click_on "Edit this line stop", match: :first

    fill_in "Date", with: @line_stop.date
    fill_in "Line number", with: @line_stop.line_number
    fill_in "Reason", with: @line_stop.reason
    fill_in "Shift", with: @line_stop.shift
    fill_in "Time restarted", with: @line_stop.time_restarted
    fill_in "Time stopped", with: @line_stop.time_stopped
    click_on "Update Line stop"

    assert_text "Line stop was successfully updated"
    click_on "Back"
  end

  test "should destroy Line stop" do
    visit line_stop_url(@line_stop)
    click_on "Destroy this line stop", match: :first

    assert_text "Line stop was successfully destroyed"
  end
end
