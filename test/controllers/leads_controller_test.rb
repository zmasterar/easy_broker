# frozen_string_literal: true

require 'test_helper'

class LeadsControllerTest < ActionDispatch::IntegrationTest
  test 'should create lead' do
    VCR.use_cassette('should create lead') do
      post leads_path,
           params: { email: 'test@email', phone: '1234567890', name: 'test name', message: 'test message',
                     property_id: 'EB-D3668', source: 'test.com' }
      assert_redirected_to property_path('EB-D3668')
    end
  end
end
