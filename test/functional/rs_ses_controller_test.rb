require 'test_helper'

class RSSesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rsses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss" do
    assert_difference('RSS.count') do
      post :create, :rss => { }
    end

    assert_redirected_to rss_path(assigns(:rss))
  end

  test "should show rss" do
    get :show, :id => rsses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rsses(:one).to_param
    assert_response :success
  end

  test "should update rss" do
    put :update, :id => rsses(:one).to_param, :rss => { }
    assert_redirected_to rss_path(assigns(:rss))
  end

  test "should destroy rss" do
    assert_difference('RSS.count', -1) do
      delete :destroy, :id => rsses(:one).to_param
    end

    assert_redirected_to rsses_path
  end
end
