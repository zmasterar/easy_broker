# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end
