require 'test_helper'

class CourseRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_registrations_index_url
    assert_response :success
  end

  test "should get new" do
    get course_registrations_new_url
    assert_response :success
  end

  test "should get show" do
    get course_registrations_show_url
    assert_response :success
  end

  test "should get edit" do
    get course_registrations_edit_url
    assert_response :success
  end

  test "should get delete" do
    get course_registrations_delete_url
    assert_response :success
  end

end
