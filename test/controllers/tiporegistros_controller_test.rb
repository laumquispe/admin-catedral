require 'test_helper'

class TiporegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiporegistro = tiporegistros(:one)
  end

  test "should get index" do
    get tiporegistros_url, as: :json
    assert_response :success
  end

  test "should create tiporegistro" do
    assert_difference('Tiporegistro.count') do
      post tiporegistros_url, params: { tiporegistro: { descripcion: @tiporegistro.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show tiporegistro" do
    get tiporegistro_url(@tiporegistro), as: :json
    assert_response :success
  end

  test "should update tiporegistro" do
    patch tiporegistro_url(@tiporegistro), params: { tiporegistro: { descripcion: @tiporegistro.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy tiporegistro" do
    assert_difference('Tiporegistro.count', -1) do
      delete tiporegistro_url(@tiporegistro), as: :json
    end

    assert_response 204
  end
end
