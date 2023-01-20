require 'test_helper'

class TipousuarioSubpermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipousuario_subpermiso = tipousuario_subpermisos(:one)
  end

  test "should get index" do
    get tipousuario_subpermisos_url, as: :json
    assert_response :success
  end

  test "should create tipousuario_subpermiso" do
    assert_difference('TipousuarioSubpermiso.count') do
      post tipousuario_subpermisos_url, params: { tipousuario_subpermiso: { subpermiso_id: @tipousuario_subpermiso.subpermiso_id, tipousuario_id: @tipousuario_subpermiso.tipousuario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show tipousuario_subpermiso" do
    get tipousuario_subpermiso_url(@tipousuario_subpermiso), as: :json
    assert_response :success
  end

  test "should update tipousuario_subpermiso" do
    patch tipousuario_subpermiso_url(@tipousuario_subpermiso), params: { tipousuario_subpermiso: { subpermiso_id: @tipousuario_subpermiso.subpermiso_id, tipousuario_id: @tipousuario_subpermiso.tipousuario_id } }, as: :json
    assert_response 200
  end

  test "should destroy tipousuario_subpermiso" do
    assert_difference('TipousuarioSubpermiso.count', -1) do
      delete tipousuario_subpermiso_url(@tipousuario_subpermiso), as: :json
    end

    assert_response 204
  end
end
