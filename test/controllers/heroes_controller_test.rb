require "test_helper"

class HeroesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get heroes_index_url
    assert_response :success
  end

  test "should get show" do
    get heroes_show_url
    assert_response :success
  end

  test "should get new" do
    get heroes_new_url
    assert_response :success
  end

  test "should get edit" do
    get heroes_edit_url
    assert_response :success
  end
end
