# frozen_string_literal: true

require 'ilkbyte/version'
require 'faraday'
require 'json'

module Ilkbyte
  class Error < StandardError; end

end

require_relative 'ilkbyte/resources/base_resource'
require_relative 'ilkbyte/server'
require_relative 'ilkbyte/domain'
require_relative 'ilkbyte/resources/account'
