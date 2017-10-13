require 'test_helper'

class QuotationRegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation_registry = quotation_registries(:one)
  end

  test "should get index" do
    get quotation_registries_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_registry_url
    assert_response :success
  end

  test "should create quotation_registry" do
    assert_difference('QuotationRegistry.count') do
      post quotation_registries_url, params: { quotation_registry: { business: @quotation_registry.business, date: @quotation_registry.date, idquotationregistry: @quotation_registry.idquotationregistry, nameclient: @quotation_registry.nameclient, product: @quotation_registry.product, validity: @quotation_registry.validity, value: @quotation_registry.value } }
    end

    assert_redirected_to quotation_registry_url(QuotationRegistry.last)
  end

  test "should show quotation_registry" do
    get quotation_registry_url(@quotation_registry)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_registry_url(@quotation_registry)
    assert_response :success
  end

  test "should update quotation_registry" do
    patch quotation_registry_url(@quotation_registry), params: { quotation_registry: { business: @quotation_registry.business, date: @quotation_registry.date, idquotationregistry: @quotation_registry.idquotationregistry, nameclient: @quotation_registry.nameclient, product: @quotation_registry.product, validity: @quotation_registry.validity, value: @quotation_registry.value } }
    assert_redirected_to quotation_registry_url(@quotation_registry)
  end

  test "should destroy quotation_registry" do
    assert_difference('QuotationRegistry.count', -1) do
      delete quotation_registry_url(@quotation_registry)
    end

    assert_redirected_to quotation_registries_url
  end
end
