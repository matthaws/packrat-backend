module JWTAuth
  def self.encode(sub)
    payload = {
      iss: ENV['packrat_client_url'],
      sub: sub,
      exp: 24.hours.from_now.to_i,
      iat: Time.now.to_i
    }
    JWT.encode payload, ENV['jwt_secret'], 'HS256'
  end

  def self.decode(token)
    options = {
      iss: ENV['packrat_client_url'],
      verify_iss: true,
      verify_iat: true,
      leeway: 30,
      algorithm: 'HS256'
    }
    JWT.decode token, ENV['jwt_secret'], true, options
  end
end
