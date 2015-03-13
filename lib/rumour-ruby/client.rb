module Rumour
  class Client
    include HTTParty
    base_uri 'rumour.herokuapp.com/api/v1'

    def initialize(api_key_or_access_token, api_secret= nil)
      @access_token = api_secret_or_access_token if api_secret.nil?; return
      @api_key = api_secret_or_access_token
    end
  end
end