# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'ilkbyte'

require 'minitest/autorun'
require 'support/vcr'


class TestBase < Minitest::Test
  parallelize_me!

  include Ilkbyte
end
