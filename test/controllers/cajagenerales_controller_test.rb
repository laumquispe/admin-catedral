require 'test_helper'

class CajageneralesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cajageneral = cajagenerales(:one)
  end

  test "should get index" do
    get cajagenerales_url, as: :json
    assert_response :success
  end

  test "should create cajageneral" do
    assert_difference('Cajageneral.count') do
      post cajagenerales_url, params: { cajageneral: { activo: @cajageneral.activo, concepto_id: @cajageneral.concepto_id, fecha: @cajageneral.fecha, formapago_id: @cajageneral.formapago_id, importe: @cajageneral.importe, nrocomprobante: @cajageneral.nrocomprobante, nroordenpago: @cajageneral.nroordenpago, observacion: @cajageneral.observacion, proveedor: @cajageneral.proveedor, subconcepto_id: @cajageneral.subconcepto_id, tipocomprobante_id: @cajageneral.tipocomprobante_id, tiporegistro_id: @cajageneral.tiporegistro_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cajageneral" do
    get cajageneral_url(@cajageneral), as: :json
    assert_response :success
  end

  test "should update cajageneral" do
    patch cajageneral_url(@cajageneral), params: { cajageneral: { activo: @cajageneral.activo, concepto_id: @cajageneral.concepto_id, fecha: @cajageneral.fecha, formapago_id: @cajageneral.formapago_id, importe: @cajageneral.importe, nrocomprobante: @cajageneral.nrocomprobante, nroordenpago: @cajageneral.nroordenpago, observacion: @cajageneral.observacion, proveedor: @cajageneral.proveedor, subconcepto_id: @cajageneral.subconcepto_id, tipocomprobante_id: @cajageneral.tipocomprobante_id, tiporegistro_id: @cajageneral.tiporegistro_id } }, as: :json
    assert_response 200
  end

  test "should destroy cajageneral" do
    assert_difference('Cajageneral.count', -1) do
      delete cajageneral_url(@cajageneral), as: :json
    end

    assert_response 204
  end
end
