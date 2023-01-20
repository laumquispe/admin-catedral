require 'test_helper'

class TipousuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipousuario = tipousuarios(:one)
  end

  test "should get index" do
    get tipousuarios_url, as: :json
    assert_response :success
  end

  test "should create tipousuario" do
    assert_difference('Tipousuario.count') do
      post tipousuarios_url, params: { tipousuario: { activo: @tipousuario.activo, descripcion: @tipousuario.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show tipousuario" do
    get tipousuario_url(@tipousuario), as: :json
    assert_response :success
  end

  test "should update tipousuario" do
    patch tipousuario_url(@tipousuario), params: { tipousuario: { activo: @tipousuario.activo, descripcion: @tipousuario.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy tipousuario" do
    assert_difference('Tipousuario.count', -1) do
      delete tipousuario_url(@tipousuario), as: :json
    end

    assert_response 204
  end
end
