require "application_system_test_case"

class DadosTest < ApplicationSystemTestCase
  setup do
    @dado = dados(:one)
  end

  test "visiting the index" do
    visit dados_url
    assert_selector "h1", text: "Dados"
  end

  test "creating a Dado" do
    visit dados_url
    click_on "New Dado"

    fill_in "Dataocorrido", with: @dado.dataocorrido
    fill_in "Descricao", with: @dado.descricao
    fill_in "Foto", with: @dado.foto
    fill_in "Pessoa", with: @dado.pessoa
    fill_in "Recompensa", with: @dado.recompensa
    fill_in "Status", with: @dado.status
    fill_in "Tipo", with: @dado.tipo
    fill_in "Titulo", with: @dado.titulo
    click_on "Create Dado"

    assert_text "Dado was successfully created"
    click_on "Back"
  end

  test "updating a Dado" do
    visit dados_url
    click_on "Edit", match: :first

    fill_in "Dataocorrido", with: @dado.dataocorrido
    fill_in "Descricao", with: @dado.descricao
    fill_in "Foto", with: @dado.foto
    fill_in "Pessoa", with: @dado.pessoa
    fill_in "Recompensa", with: @dado.recompensa
    fill_in "Status", with: @dado.status
    fill_in "Tipo", with: @dado.tipo
    fill_in "Titulo", with: @dado.titulo
    click_on "Update Dado"

    assert_text "Dado was successfully updated"
    click_on "Back"
  end

  test "destroying a Dado" do
    visit dados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dado was successfully destroyed"
  end
end
