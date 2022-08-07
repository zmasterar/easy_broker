# frozen_string_literal: true

# EasyBroker API connection class
class EasyBrokerAPI
  include HTTParty
  format :json
  base_uri 'https://api.stagingeb.com/v1'

  def initialize
    api_key = Rails.application.credentials.easy_broker_api_key
    @options = { headers: { 'X-Authorization': api_key } }
  end

  def properties(page: 1, limit: 15, only_published: false)
    @options.merge!(query: { page:, limit: })
    @options[:query].merge!("search[statuses][]": 'published') if only_published
    res = self.class.get('/properties', @options)
    raise EasyBrokerAPI::AuthenticationError if res.code == 401

    [res['content'], res['pagination']]
  end

  def property(id)
    res = self.class.get("/properties/#{id}", @options)
    raise EasyBrokerAPI::AuthenticationError if res.code == 401

    JSON.parse(res.body)
  end

  def create_lead(params)
    @options.merge!(body: params.to_json)
    @options[:headers].merge!({ 'Content-Type': 'application/json' })
    res = self.class.post('/contact_requests', @options)
    raise EasyBrokerAPI::AuthenticationError if res.code == 401

    res
  end

  # class AuthenticationError
  class AuthenticationError < StandardError
    def initialize
      super('Invalid API Key')
    end
  end
end
