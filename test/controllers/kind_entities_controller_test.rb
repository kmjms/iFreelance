require 'test_helper'

class KindEntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kind_entity = kind_entities(:one)
  end

  test "should get index" do
    get kind_entities_url
    assert_response :success
  end

  test "should get new" do
    get new_kind_entity_url
    assert_response :success
  end

  test "should create kind_entity" do
    assert_difference('KindEntity.count') do
      post kind_entities_url, params: { kind_entity: { name: @kind_entity.name, permits: @kind_entity.permits } }
    end

    assert_redirected_to kind_entity_url(KindEntity.last)
  end

  test "should show kind_entity" do
    get kind_entity_url(@kind_entity)
    assert_response :success
  end

  test "should get edit" do
    get edit_kind_entity_url(@kind_entity)
    assert_response :success
  end

  test "should update kind_entity" do
    patch kind_entity_url(@kind_entity), params: { kind_entity: { name: @kind_entity.name, permits: @kind_entity.permits } }
    assert_redirected_to kind_entity_url(@kind_entity)
  end

  test "should destroy kind_entity" do
    assert_difference('KindEntity.count', -1) do
      delete kind_entity_url(@kind_entity)
    end

    assert_redirected_to kind_entities_url
  end
end
