# frozen_string_literal: true

require 'webmock/rspec'
require 'vcr'
require 'zlib'

VCR.configure do |vcr|
  vcr.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  vcr.hook_into :webmock
end