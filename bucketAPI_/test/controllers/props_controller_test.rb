require 'test_helper'

class PropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prop = props(:one)
  end

  test "should get index" do
    get props_url, as: :json
    assert_response :success
  end

  test "should create prop" do
    assert_difference('Prop.count') do
      post props_url, params: { prop: { item: @prop.item, user_id: @prop.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show prop" do
    get prop_url(@prop), as: :json
    assert_response :success
  end

  test "should update prop" do
    patch prop_url(@prop), params: { prop: { item: @prop.item, user_id: @prop.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy prop" do
    assert_difference('Prop.count', -1) do
      delete prop_url(@prop), as: :json
    end

    assert_response 204
  end
end
