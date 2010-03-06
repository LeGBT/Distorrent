require 'test_helper'

class RsslistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rsslists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rsslist" do
    assert_difference('Rsslist.count') do
      post :create, :rsslist => { }
    end

    assert_redirected_to rsslist_path(assigns(:rsslist))
  end

  test "should show rsslist" do
    get :show, :id => rsslists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rsslists(:one).to_param
    assert_response :success
  end

  test "should update rsslist" do
    put :update, :id => rsslists(:one).to_param, :rsslist => { }
    assert_redirected_to rsslist_path(assigns(:rsslist))
  end

  test "should destroy rsslist" do
    assert_difference('Rsslist.count', -1) do
      delete :destroy, :id => rsslists(:one).to_param
    end

    assert_redirected_to rsslists_path
  end
end
