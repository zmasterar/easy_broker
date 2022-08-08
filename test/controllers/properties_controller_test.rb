# frozen_string_literal: true

require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    VCR.use_cassette('should get index') do
      get properties_path
      assert_response :success
    end
  end
  test 'should get property page' do
    VCR.use_cassette('should get property page') do
      get property_path('EB-D3662')
      assert_response :success
    end
  end
end
