# frozen_string_literal: true

require 'webmock/rspec'
require 'vcr'
require 'zlib'

VCR.configure do |vcr|
  vcr.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  vcr.hook_into :webmock

  vcr.preserve_exact_body_bytes do |http_message|
    http_message.body.encoding.name == 'ASCII-8BIT' || !http_message.body.valid_encoding?
  end

  bin2ascii = lambda do |value|
    value.force_encoding('us-ascii') if value && value.encoding.name == 'ASCII-8BIT'
    value
  end

  normalize_headers = lambda do |headers|
    headers.keys.each do |key|
      value = headers[key]

      if key.encoding.name == 'ASCII-8BIT'
        old_key = key
        key = bin2ascii.call(key.dup)
        headers.delete(old_key)
        headers[key] = value
      end

      Array(value).each { |v| bin2ascii.call(v) }

      headers[key] = value[0] if Array == value && value.size < 2
    end
  end

  vcr.before_record do |i|
    if (enc = i.response.headers['Content-Encoding']) && (Array(enc).first == 'gzip')
      i.response.body = Zlib::GzipReader.new(StringIO.new(i.response.body), encoding: 'ASCII-8BIT').read
      i.response.update_content_length_header
      i.response.headers.delete 'Content-Encoding'
    end

    _type, charset = Array(i.response.headers['Content-Type']).join(',').split(';')

    i.response.body.force_encoding(Regexp.last_match(1)) if charset =~ /charset=(\S+)/

    bin2ascii.call(i.response.status.message)
    normalize_headers.call(i.request.headers)
    normalize_headers.call(i.response.headers)
  end
end
