# frozen_string_literal: true

require 'test_helper'

class ApiKeysControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_keys_index_url
    assert_response :success
  end

  test 'should get create' do
    get api_keys_create_url
    assert_response :success
  end

  test 'should get delete' do
    get api_keys_delete_url
    assert_response :success
  end
end
