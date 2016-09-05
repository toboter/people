require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { about: @person.about, birthday: @person.birthday, deathday: @person.deathday, family_name: @person.family_name, gender: @person.gender, given_name: @person.given_name, honorific_prefix: @person.honorific_prefix, honorific_suffix: @person.honorific_suffix, middle_name: @person.middle_name, place_of_birth: @person.place_of_birth } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { about: @person.about, birthday: @person.birthday, deathday: @person.deathday, family_name: @person.family_name, gender: @person.gender, given_name: @person.given_name, honorific_prefix: @person.honorific_prefix, honorific_suffix: @person.honorific_suffix, middle_name: @person.middle_name, place_of_birth: @person.place_of_birth } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
