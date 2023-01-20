require 'test_helper'

class ProveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proveedor = proveedores(:one)
  end

  test "should get index" do
    get proveedores_url, as: :json
    assert_response :success
  end

  test "should create proveedor" do
    assert_difference('Proveedor.count') do
      post proveedores_url, params: { proveedor: { activo: @proveedor.activo, descripcion: @proveedor.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show proveedor" do
    get proveedor_url(@proveedor), as: :json
    assert_response :success
  end

  test "should update proveedor" do
    patch proveedor_url(@proveedor), params: { proveedor: { activo: @proveedor.activo, descripcion: @proveedor.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy proveedor" do
    assert_difference('Proveedor.count', -1) do
      delete proveedor_url(@proveedor), as: :json
    end

    assert_response 204
  end
end
