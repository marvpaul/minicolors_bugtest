require 'test_helper'

class EinTextsControllerTest < ActionController::TestCase
  setup do
    @ein_text = ein_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ein_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ein_text" do
    assert_difference('EinText.count') do
      post :create, ein_text: { farbe: @ein_text.farbe, text: @ein_text.text }
    end

    assert_redirected_to ein_text_path(assigns(:ein_text))
  end

  test "should show ein_text" do
    get :show, id: @ein_text
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ein_text
    assert_response :success
  end

  test "should update ein_text" do
    put :update, id: @ein_text, ein_text: { farbe: @ein_text.farbe, text: @ein_text.text }
    assert_redirected_to ein_text_path(assigns(:ein_text))
  end

  test "should destroy ein_text" do
    assert_difference('EinText.count', -1) do
      delete :destroy, id: @ein_text
    end

    assert_redirected_to ein_texts_path
  end
end
