require 'test_helper'

class FilterlistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filterlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filterlist" do
    assert_difference('Filterlist.count') do
      post :create, :filterlist => { }
    end

    assert_redirected_to filterlist_path(assigns(:filterlist))
  end

  test "should show filterlist" do
    get :show, :id => filterlists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => filterlists(:one).to_param
    assert_response :success
  end

  test "should update filterlist" do
    put :update, :id => filterlists(:one).to_param, :filterlist => { }
    assert_redirected_to filterlist_path(assigns(:filterlist))
  end

  test "should destroy filterlist" do
    assert_difference('Filterlist.count', -1) do
      delete :destroy, :id => filterlists(:one).to_param
    end

    assert_redirected_to filterlists_path
  end
end
