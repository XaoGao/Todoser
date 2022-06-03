class JwtService
  def self.encode(payload, expired = DateTime.now + 1.hour)
    payload[:exp] = expired.to_i
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, 'HS256')
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key, 
                               true, { algorithm: 'HS256' })[0]
    HashWithIndifferentAccess.new(decoded_token)
  end
end
