require 'httparty'
require 'json'
require 'base64'
require 'forwardable'

module Rumour
  class Client
    include HTTParty
    base_uri 'rumour.herokuapp.com/api/v1'

    attr_accessor :access_token

    def initialize(access_token = nil)
      @access_token = access_token || Rumour.configuration.access_token
    end

    def send_text_message(sender, recipients, body)
      recipients = [recipients].flatten
      post('/text_messages', text_message: { from: sender, recipients: recipients, body: body })
    end

    def deliver_push_notification(platform, recipients, data)
      recipients = [recipients].flatten
      post('/push_notifications', platform: platform, recipients: recipients, data: data)
    end

    private

    def post(url, params = {}, headers = {})
      response = self.class.post(url, query: params, headers: headers.merge(auth_header))
      JSON.parse(response.body)
    end

    def auth_header
      { 'Authorization' => "Bearer #{credentials}" }
    end

    def credentials
      Base64.urlsafe_encode64(@access_token)
    end
  end
end
