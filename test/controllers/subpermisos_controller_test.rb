require 'test_helper'

class SubpermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subpermiso = subpermisos(:one)
  end

  test "should get index" do
    get subpermisos_url, as: :json
    assert_response :success
  end

  test "should create subpermiso" do
    assert_difference('Subpermiso.count') do
      post subpermisos_url, params: { subpermiso: { activo: @subpermiso.activo, descripcion: @subpermiso.descripcion, icono: @subpermiso.icono, opcion: @subpermiso.opcion, permiso_id: @subpermiso.permiso_id, url: @subpermiso.url } }, as: :json
    end

    assert_response 201
  end

  test "should show subpermiso" do
    get subpermiso_url(@subpermiso), as: :json
    assert_response :success
  end

  test "should update subpermiso" do
    patch subpermiso_url(@subpermiso), params: { subpermiso: { activo: @subpermiso.activo, descripcion: @subpermiso.descripcion, icono: @subpermiso.icono, opcion: @subpermiso.opcion, permiso_id: @subpermiso.permiso_id, url: @subpermiso.url } }, as: :json
    assert_response 200
  end

  test "should destroy subpermiso" do
    assert_difference('Subpermiso.count', -1) do
      delete subpermiso_url(@subpermiso), as: :json
    end

    assert_response 204
  end
end
