require 'test_helper'

class CtacteproveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ctacteproveedor = ctacteproveedores(:one)
  end

  test "should get index" do
    get ctacteproveedores_url, as: :json
    assert_response :success
  end

  test "should create ctacteproveedor" do
    assert_difference('Ctacteproveedor.count') do
      post ctacteproveedores_url, params: { ctacteproveedor: { activo: @ctacteproveedor.activo, egreso: @ctacteproveedor.egreso, fecha: @ctacteproveedor.fecha, ingreso: @ctacteproveedor.ingreso, numerofactura: @ctacteproveedor.numerofactura, proveedor_id: @ctacteproveedor.proveedor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ctacteproveedor" do
    get ctacteproveedor_url(@ctacteproveedor), as: :json
    assert_response :success
  end

  test "should update ctacteproveedor" do
    patch ctacteproveedor_url(@ctacteproveedor), params: { ctacteproveedor: { activo: @ctacteproveedor.activo, egreso: @ctacteproveedor.egreso, fecha: @ctacteproveedor.fecha, ingreso: @ctacteproveedor.ingreso, numerofactura: @ctacteproveedor.numerofactura, proveedor_id: @ctacteproveedor.proveedor_id } }, as: :json
    assert_response 200
  end

  test "should destroy ctacteproveedor" do
    assert_difference('Ctacteproveedor.count', -1) do
      delete ctacteproveedor_url(@ctacteproveedor), as: :json
    end

    assert_response 204
  end
end
