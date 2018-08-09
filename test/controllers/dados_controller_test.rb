require 'test_helper'

class DadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dado = dados(:one)
  end

  test "should get index" do
    get dados_url
    assert_response :success
  end

  test "should get new" do
    get new_dado_url
    assert_response :success
  end

  test "should create dado" do
    assert_difference('Dado.count') do
      post dados_url, params: { dado: { dataocorrido: @dado.dataocorrido, descricao: @dado.descricao, foto: @dado.foto, pessoa: @dado.pessoa, recompensa: @dado.recompensa, status: @dado.status, tipo: @dado.tipo, titulo: @dado.titulo } }
    end

    assert_redirected_to dado_url(Dado.last)
  end

  test "should show dado" do
    get dado_url(@dado)
    assert_response :success
  end

  test "should get edit" do
    get edit_dado_url(@dado)
    assert_response :success
  end

  test "should update dado" do
    patch dado_url(@dado), params: { dado: { dataocorrido: @dado.dataocorrido, descricao: @dado.descricao, foto: @dado.foto, pessoa: @dado.pessoa, recompensa: @dado.recompensa, status: @dado.status, tipo: @dado.tipo, titulo: @dado.titulo } }
    assert_redirected_to dado_url(@dado)
  end

  test "should destroy dado" do
    assert_difference('Dado.count', -1) do
      delete dado_url(@dado)
    end

    assert_redirected_to dados_url
  end
end
