require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    # HTTP authentication for tests.
    @person.update(password: 'foo', password_confirmation: 'foo')
    @http_auth = {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(@person.name, 'foo') }
  end

  test "should get index" do
    get people_url, headers: @http_auth
    assert_response :success
  end

  test "should get new" do
    get new_person_url, headers: @http_auth
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { credit: @person.credit, name: @person.name, password: 'foo', password_confirmation: 'foo' } }, headers: @http_auth
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person), headers: @http_auth
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person), headers: @http_auth
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { credit: @person.credit, name: @person.name, password: 'foo', password_confirmation: 'foo' } }, headers: @http_auth
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person), headers: @http_auth
    end

    assert_redirected_to people_url
  end
end
