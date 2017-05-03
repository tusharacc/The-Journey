require 'test_helper'

class PhotoDetailsControllerTest < ActionController::TestCase
  setup do
    @photo_detail = photo_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_detail" do
    assert_difference('PhotoDetail.count') do
      post :create, photo_detail: { date_taken: @photo_detail.date_taken, link: @photo_detail.link, place_taken: @photo_detail.place_taken, story: @photo_detail.story, title: @photo_detail.title }
    end

    assert_redirected_to photo_detail_path(assigns(:photo_detail))
  end

  test "should show photo_detail" do
    get :show, id: @photo_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_detail
    assert_response :success
  end

  test "should update photo_detail" do
    patch :update, id: @photo_detail, photo_detail: { date_taken: @photo_detail.date_taken, link: @photo_detail.link, place_taken: @photo_detail.place_taken, story: @photo_detail.story, title: @photo_detail.title }
    assert_redirected_to photo_detail_path(assigns(:photo_detail))
  end

  test "should destroy photo_detail" do
    assert_difference('PhotoDetail.count', -1) do
      delete :destroy, id: @photo_detail
    end

    assert_redirected_to photo_details_path
  end
end
