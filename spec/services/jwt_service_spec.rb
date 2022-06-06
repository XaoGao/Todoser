require 'rails_helper'

RSpec.describe JwtService do
  subject { described_class }

  let(:payload) { { id: 13 } }
  let(:default_expire_time) { DateTime.now + 1.hour }

  describe '.encode' do
    it 'encodes correctly' do
      token = JwtService.encode(payload)
      expect(JwtService.decode(token)).to include(id: 13, exp: default_expire_time.to_i)
    end
  end

  describe '.decode' do
    it 'decodes correctly' do
      token = JwtService.encode(payload)
      decoded_payload = JwtService.decode(token)

      expect(decoded_payload[:id]).to be 13
      expect(decoded_payload[:exp]).to be default_expire_time.to_i
    end

    it 'raises decode error if token is nil' do
      token = nil
      expect { JwtService.decode(token) }.to raise_error(JWT::DecodeError)
    end

    it 'raises decode error if token is blank string' do
      token = ''
      expect { JwtService.decode(token) }.to raise_error(JWT::DecodeError)
    end

    it 'raises verification error if token is invalid' do
      invalid_token = JWT.encode(payload, '7351c74ded9f7ef9e23db7c3cfb1c0d3e', 'HS256')
      expect { JwtService.decode(invalid_token) }.to raise_error(JWT::VerificationError)
    end
  end
end
