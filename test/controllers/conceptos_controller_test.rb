require 'test_helper'

class ConceptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concepto = conceptos(:one)
  end

  test "should get index" do
    get conceptos_url, as: :json
    assert_response :success
  end

  test "should create concepto" do
    assert_difference('Concepto.count') do
      post conceptos_url, params: { concepto: { activo: @concepto.activo, descripcion: @concepto.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show concepto" do
    get concepto_url(@concepto), as: :json
    assert_response :success
  end

  test "should update concepto" do
    patch concepto_url(@concepto), params: { concepto: { activo: @concepto.activo, descripcion: @concepto.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy concepto" do
    assert_difference('Concepto.count', -1) do
      delete concepto_url(@concepto), as: :json
    end

    assert_response 204
  end
end
