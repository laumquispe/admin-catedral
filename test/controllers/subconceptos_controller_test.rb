require 'test_helper'

class SubconceptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subconcepto = subconceptos(:one)
  end

  test "should get index" do
    get subconceptos_url, as: :json
    assert_response :success
  end

  test "should create subconcepto" do
    assert_difference('Subconcepto.count') do
      post subconceptos_url, params: { subconcepto: { activo: @subconcepto.activo, concepto_id: @subconcepto.concepto_id, descripcion: @subconcepto.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show subconcepto" do
    get subconcepto_url(@subconcepto), as: :json
    assert_response :success
  end

  test "should update subconcepto" do
    patch subconcepto_url(@subconcepto), params: { subconcepto: { activo: @subconcepto.activo, concepto_id: @subconcepto.concepto_id, descripcion: @subconcepto.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy subconcepto" do
    assert_difference('Subconcepto.count', -1) do
      delete subconcepto_url(@subconcepto), as: :json
    end

    assert_response 204
  end
end
