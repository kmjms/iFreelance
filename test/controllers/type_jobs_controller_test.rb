require 'test_helper'

class TypeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_job = type_jobs(:one)
  end

  test "should get index" do
    get type_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_type_job_url
    assert_response :success
  end

  test "should create type_job" do
    assert_difference('TypeJob.count') do
      post type_jobs_url, params: { type_job: { name: @type_job.name, skilsRequired: @type_job.skilsRequired } }
    end

    assert_redirected_to type_job_url(TypeJob.last)
  end

  test "should show type_job" do
    get type_job_url(@type_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_job_url(@type_job)
    assert_response :success
  end

  test "should update type_job" do
    patch type_job_url(@type_job), params: { type_job: { name: @type_job.name, skilsRequired: @type_job.skilsRequired } }
    assert_redirected_to type_job_url(@type_job)
  end

  test "should destroy type_job" do
    assert_difference('TypeJob.count', -1) do
      delete type_job_url(@type_job)
    end

    assert_redirected_to type_jobs_url
  end
end
