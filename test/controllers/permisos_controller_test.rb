require 'test_helper'

class PermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permiso = permisos(:one)
  end

  test "should get index" do
    get permisos_url, as: :json
    assert_response :success
  end

  test "should create permiso" do
    assert_difference('Permiso.count') do
      post permisos_url, params: { permiso: { activo: @permiso.activo, descripcion: @permiso.descripcion, icono: @permiso.icono, opcion: @permiso.opcion, url: @permiso.url } }, as: :json
    end

    assert_response 201
  end

  test "should show permiso" do
    get permiso_url(@permiso), as: :json
    assert_response :success
  end

  test "should update permiso" do
    patch permiso_url(@permiso), params: { permiso: { activo: @permiso.activo, descripcion: @permiso.descripcion, icono: @permiso.icono, opcion: @permiso.opcion, url: @permiso.url } }, as: :json
    assert_response 200
  end

  test "should destroy permiso" do
    assert_difference('Permiso.count', -1) do
      delete permiso_url(@permiso), as: :json
    end

    assert_response 204
  end
end
