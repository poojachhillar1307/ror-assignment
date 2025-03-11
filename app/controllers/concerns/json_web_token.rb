require 'jwt'

module JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base || ENV['SECRET_KEY_BASE']

  # Encode a payload into a JWT token
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i # Set expiration time
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode a JWT token
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0] # Extract payload from token
    HashWithIndifferentAccess.new(decoded) # Return hash with indifferent access (can use string/symbol keys)
  rescue JWT::ExpiredSignature
    nil # Token expired
  rescue JWT::DecodeError
    nil # Invalid token
  end
end
