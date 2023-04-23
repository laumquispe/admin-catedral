require 'test_helper'

class CajamensualesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cajamensual = cajamensuales(:one)
  end

  test "should get index" do
    get cajamensuales_url, as: :json
    assert_response :success
  end

  test "should create cajamensual" do
    assert_difference('Cajamensual.count') do
      post cajamensuales_url, params: { cajamensual: { egreso: @cajamensual.egreso, ingreso: @cajamensual.ingreso, periodo: @cajamensual.periodo, saldocierre: @cajamensual.saldocierre, saldoinicial: @cajamensual.saldoinicial } }, as: :json
    end

    assert_response 201
  end

  test "should show cajamensual" do
    get cajamensual_url(@cajamensual), as: :json
    assert_response :success
  end

  test "should update cajamensual" do
    patch cajamensual_url(@cajamensual), params: { cajamensual: { egreso: @cajamensual.egreso, ingreso: @cajamensual.ingreso, periodo: @cajamensual.periodo, saldocierre: @cajamensual.saldocierre, saldoinicial: @cajamensual.saldoinicial } }, as: :json
    assert_response 200
  end

  test "should destroy cajamensual" do
    assert_difference('Cajamensual.count', -1) do
      delete cajamensual_url(@cajamensual), as: :json
    end

    assert_response 204
  end
end
