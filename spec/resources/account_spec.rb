# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ilkbyte::Account do
  let(:operation) { described_class.new(access_key: 'access_key', secret_key: 'secret_key') }

  context '#success' do
    it 'should retrieve account' do
      VCR.use_cassette 'account/retrieve' do
        operation.retrieve
      end

      expect(operation.success?).to eq(true)
    end

    it 'should get users' do
      VCR.use_cassette 'account/users' do
        operation.users
      end

      expect(operation.success?).to eq(true)
    end
  end
end
