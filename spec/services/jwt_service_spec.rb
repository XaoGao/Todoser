require 'rails_helper'

RSpec.describe JwtService do
  before :each do
    @payload = { id: 13 }
    @default_expire_time = DateTime.now + 1.hour
  end

  it 'encodes correctly' do
    token = JwtService.encode(@payload)

    expect(JwtService.decode(token)).to include(id: 13, exp: @default_expire_time.to_i)
  end

  it 'decodes correctly' do
    token = JwtService.encode(@payload)
    decoded_payload = JwtService.decode(token)

    expect(decoded_payload[:id]).to be 13
    expect(decoded_payload[:exp]).to be @default_expire_time.to_i
  end
end
