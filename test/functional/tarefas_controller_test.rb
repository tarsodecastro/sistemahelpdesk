require 'test_helper'

class TarefasControllerTest < ActionController::TestCase
  setup do
    @tarefa = tarefas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarefas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarefa" do
    assert_difference('Tarefa.count') do
      post :create, tarefa: { completado: @tarefa.completado, cortesia: @tarefa.cortesia, descricao: @tarefa.descricao, nome: @tarefa.nome, observacao: @tarefa.observacao, valor_tarefa: @tarefa.valor_tarefa }
    end

    assert_redirected_to tarefa_path(assigns(:tarefa))
  end

  test "should show tarefa" do
    get :show, id: @tarefa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tarefa
    assert_response :success
  end

  test "should update tarefa" do
    put :update, id: @tarefa, tarefa: { completado: @tarefa.completado, cortesia: @tarefa.cortesia, descricao: @tarefa.descricao, nome: @tarefa.nome, observacao: @tarefa.observacao, valor_tarefa: @tarefa.valor_tarefa }
    assert_redirected_to tarefa_path(assigns(:tarefa))
  end

  test "should destroy tarefa" do
    assert_difference('Tarefa.count', -1) do
      delete :destroy, id: @tarefa
    end

    assert_redirected_to tarefas_path
  end
end
