require "test_helper"

class ReactionTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reaction_time = reaction_times(:one)
  end

  test "should get index" do
    get reaction_times_url
    assert_response :success
  end

  test "should get new" do
    get new_reaction_time_url
    assert_response :success
  end

  test "should create reaction_time" do
    assert_difference("ReactionTime.count") do
      post reaction_times_url, params: { reaction_time: { cloudy_time: @reaction_time.cloudy_time, gel_time: @reaction_time.gel_time, time: @reaction_time.time } }
    end

    assert_redirected_to reaction_time_url(ReactionTime.last)
  end

  test "should show reaction_time" do
    get reaction_time_url(@reaction_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_reaction_time_url(@reaction_time)
    assert_response :success
  end

  test "should update reaction_time" do
    patch reaction_time_url(@reaction_time), params: { reaction_time: { cloudy_time: @reaction_time.cloudy_time, gel_time: @reaction_time.gel_time, time: @reaction_time.time } }
    assert_redirected_to reaction_time_url(@reaction_time)
  end

  test "should destroy reaction_time" do
    assert_difference("ReactionTime.count", -1) do
      delete reaction_time_url(@reaction_time)
    end

    assert_redirected_to reaction_times_url
  end
end
