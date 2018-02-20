require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { amount: @order.amount, birthday: @order.birthday, border_point: @order.border_point, customer_name: @order.customer_name, email: @order.email, entry_date: @order.entry_date, fast_track: @order.fast_track, gender: @order.gender, nationality: @order.nationality, passport_end: @order.passport_end, passport_issued: @order.passport_issued, passport_name: @order.passport_name, passport_number: @order.passport_number, phone: @order.phone, private_letter: @order.private_letter, speed: @order.speed, visa: @order.visa }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { amount: @order.amount, birthday: @order.birthday, border_point: @order.border_point, customer_name: @order.customer_name, email: @order.email, entry_date: @order.entry_date, fast_track: @order.fast_track, gender: @order.gender, nationality: @order.nationality, passport_end: @order.passport_end, passport_issued: @order.passport_issued, passport_name: @order.passport_name, passport_number: @order.passport_number, phone: @order.phone, private_letter: @order.private_letter, speed: @order.speed, visa: @order.visa }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
