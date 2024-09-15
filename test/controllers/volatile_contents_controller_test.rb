require "test_helper"

class VolatileContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volatile_content = volatile_contents(:one)
  end

  test "should get index" do
    get volatile_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_volatile_content_url
    assert_response :success
  end

  test "should create volatile_content" do
    assert_difference("VolatileContent.count") do
      post volatile_contents_url, params: { volatile_content: { max: @volatile_content.max, min: @volatile_content.min, time: @volatile_content.time } }
    end

    assert_redirected_to volatile_content_url(VolatileContent.last)
  end

  test "should show volatile_content" do
    get volatile_content_url(@volatile_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_volatile_content_url(@volatile_content)
    assert_response :success
  end

  test "should update volatile_content" do
    patch volatile_content_url(@volatile_content), params: { volatile_content: { max: @volatile_content.max, min: @volatile_content.min, time: @volatile_content.time } }
    assert_redirected_to volatile_content_url(@volatile_content)
  end

  test "should destroy volatile_content" do
    assert_difference("VolatileContent.count", -1) do
      delete volatile_content_url(@volatile_content)
    end

    assert_redirected_to volatile_contents_url
  end
end
