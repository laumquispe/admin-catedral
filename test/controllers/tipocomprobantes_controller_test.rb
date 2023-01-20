require 'test_helper'

class TipocomprobantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipocomprobante = tipocomprobantes(:one)
  end

  test "should get index" do
    get tipocomprobantes_url, as: :json
    assert_response :success
  end

  test "should create tipocomprobante" do
    assert_difference('Tipocomprobante.count') do
      post tipocomprobantes_url, params: { tipocomprobante: { abreviacion: @tipocomprobante.abreviacion, activo: @tipocomprobante.activo, descripcion: @tipocomprobante.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show tipocomprobante" do
    get tipocomprobante_url(@tipocomprobante), as: :json
    assert_response :success
  end

  test "should update tipocomprobante" do
    patch tipocomprobante_url(@tipocomprobante), params: { tipocomprobante: { abreviacion: @tipocomprobante.abreviacion, activo: @tipocomprobante.activo, descripcion: @tipocomprobante.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy tipocomprobante" do
    assert_difference('Tipocomprobante.count', -1) do
      delete tipocomprobante_url(@tipocomprobante), as: :json
    end

    assert_response 204
  end
end
