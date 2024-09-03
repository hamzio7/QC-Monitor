require "test_helper"

class LineStopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_stop = line_stops(:one)
  end

  test "should get index" do
    get line_stops_url
    assert_response :success
  end

  test "should get new" do
    get new_line_stop_url
    assert_response :success
  end

  test "should create line_stop" do
    assert_difference("LineStop.count") do
      post line_stops_url, params: { line_stop: { date: @line_stop.date, line_number: @line_stop.line_number, reason: @line_stop.reason, shift: @line_stop.shift, time_restarted: @line_stop.time_restarted, time_stopped: @line_stop.time_stopped } }
    end

    assert_redirected_to line_stop_url(LineStop.last)
  end

  test "should show line_stop" do
    get line_stop_url(@line_stop)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_stop_url(@line_stop)
    assert_response :success
  end

  test "should update line_stop" do
    patch line_stop_url(@line_stop), params: { line_stop: { date: @line_stop.date, line_number: @line_stop.line_number, reason: @line_stop.reason, shift: @line_stop.shift, time_restarted: @line_stop.time_restarted, time_stopped: @line_stop.time_stopped } }
    assert_redirected_to line_stop_url(@line_stop)
  end

  test "should destroy line_stop" do
    assert_difference("LineStop.count", -1) do
      delete line_stop_url(@line_stop)
    end

    assert_redirected_to line_stops_url
  end
end
