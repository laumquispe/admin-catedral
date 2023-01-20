require 'test_helper'

class TipousuarioPermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipousuario_permiso = tipousuario_permisos(:one)
  end

  test "should get index" do
    get tipousuario_permisos_url, as: :json
    assert_response :success
  end

  test "should create tipousuario_permiso" do
    assert_difference('TipousuarioPermiso.count') do
      post tipousuario_permisos_url, params: { tipousuario_permiso: { permiso_id: @tipousuario_permiso.permiso_id, tipousuario_id: @tipousuario_permiso.tipousuario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show tipousuario_permiso" do
    get tipousuario_permiso_url(@tipousuario_permiso), as: :json
    assert_response :success
  end

  test "should update tipousuario_permiso" do
    patch tipousuario_permiso_url(@tipousuario_permiso), params: { tipousuario_permiso: { permiso_id: @tipousuario_permiso.permiso_id, tipousuario_id: @tipousuario_permiso.tipousuario_id } }, as: :json
    assert_response 200
  end

  test "should destroy tipousuario_permiso" do
    assert_difference('TipousuarioPermiso.count', -1) do
      delete tipousuario_permiso_url(@tipousuario_permiso), as: :json
    end

    assert_response 204
  end
end
