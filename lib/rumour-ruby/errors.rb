module Rumour
  class Errors
    class ServerError < StandardError; end
    class AuthenticationError < StandardError; end
    class RequestError < StandardError; end
  end
end
