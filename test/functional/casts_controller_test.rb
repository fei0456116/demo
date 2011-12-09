require 'test_helper'

class CastsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Cast.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Cast.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Cast.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cast_url(assigns(:cast))
  end

  def test_edit
    get :edit, :id => Cast.first
    assert_template 'edit'
  end

  def test_update_invalid
    Cast.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cast.first
    assert_template 'edit'
  end

  def test_update_valid
    Cast.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cast.first
    assert_redirected_to cast_url(assigns(:cast))
  end

  def test_destroy
    cast = Cast.first
    delete :destroy, :id => cast
    assert_redirected_to casts_url
    assert !Cast.exists?(cast.id)
  end
end
