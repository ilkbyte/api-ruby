# frozen_string_literal: true

require 'ilkbyte/version'
require 'faraday'
require 'json'

module Ilkbyte
  class Error < StandardError; end

end

require_relative 'ilkbyte/client'
require_relative 'ilkbyte/api/base_api'
require_relative 'ilkbyte/api/servers_api'
require_relative 'ilkbyte/api/domains_api'
require_relative 'ilkbyte/api/account_api'
