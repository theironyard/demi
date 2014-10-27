RSpec.configure do |c|
  c.include(Module.new do
    def as user_or_role
      user = user_or_role.is_a?(User) ? user_or_role : create(:user, user_or_role)
      key  = user.api_keys.last || user.api_keys.generate!
      request.headers["Authorization"] = key.nonce
    end
  end)
end

class ActionController::TestResponse
  def json
    j = JSON.parse body
    if j.is_a? Hash
      Hashie::Mash.new j
    else
      j.map { |o| Hashie::Mash.new o }
    end
  end
end
