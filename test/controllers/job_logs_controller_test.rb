require 'test_helper'

class JobLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_log = job_logs(:one)
  end

  test "should get index" do
    get job_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_log_url
    assert_response :success
  end

  test "should create job_log" do
    assert_difference('JobLog.count') do
      post job_logs_url, params: { job_log: { message: @job_log.message, state_code: @job_log.state_code } }
    end

    assert_redirected_to job_log_url(JobLog.last)
  end

  test "should show job_log" do
    get job_log_url(@job_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_log_url(@job_log)
    assert_response :success
  end

  test "should update job_log" do
    patch job_log_url(@job_log), params: { job_log: { message: @job_log.message, state_code: @job_log.state_code } }
    assert_redirected_to job_log_url(@job_log)
  end

  test "should destroy job_log" do
    assert_difference('JobLog.count', -1) do
      delete job_log_url(@job_log)
    end

    assert_redirected_to job_logs_url
  end
end
