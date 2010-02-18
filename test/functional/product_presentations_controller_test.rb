require 'test_helper'

class ProductPresentationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_presentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_presentation" do
    assert_difference('ProductPresentation.count') do
      post :create, :product_presentation => { }
    end

    assert_redirected_to product_presentation_path(assigns(:product_presentation))
  end

  test "should show product_presentation" do
    get :show, :id => product_presentations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => product_presentations(:one).to_param
    assert_response :success
  end

  test "should update product_presentation" do
    put :update, :id => product_presentations(:one).to_param, :product_presentation => { }
    assert_redirected_to product_presentation_path(assigns(:product_presentation))
  end

  test "should destroy product_presentation" do
    assert_difference('ProductPresentation.count', -1) do
      delete :destroy, :id => product_presentations(:one).to_param
    end

    assert_redirected_to product_presentations_path
  end
end
