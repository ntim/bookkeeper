require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
    @person = people(:one)
    # HTTP authentication for tests.
    @person.update(password: 'foo', password_confirmation: 'foo')
    @http_auth = {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(@person.name, 'foo') }
  end

  test "should get index" do
    get expenses_url, headers: @http_auth
    assert_response :success
  end

  test "should get new" do
    get new_expense_url, headers: @http_auth
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post expenses_url, params: { expense: { description: @expense.description, person_id: @expense.person_id, price: @expense.price } }, headers: @http_auth
    end

    assert_redirected_to new_expense_url(person: @expense.person), headers: @http_auth
  end

  test "should show expense" do
    get expense_url(@expense), headers: @http_auth
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_url(@expense), headers: @http_auth
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(@expense), params: { expense: { description: @expense.description, person_id: @expense.person_id, price: @expense.price } }, headers: @http_auth
    assert_redirected_to root_url
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense), headers: @http_auth
    end

    assert_redirected_to root_url
  end
end
