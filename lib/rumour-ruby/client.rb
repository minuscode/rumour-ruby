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
      raise Rumour::Errors::AuthenticationError.new('Missing access token') if @access_token.nil?
    end

    def send_text_message(sender, recipient, body)
      recipient = intercept_tm_recipient || recipient
      post('/text_messages', text_message: { from: sender, recipient: recipient, body: body })
    end

    def send_push_notification(recipients, options= {})
      recipients = intercept_pn_recipients unless [intercept_pn_recipients].compact.empty?
      post('/push_notifications', push_notification: { recipients: [recipients].flatten }.merge(options))
    end

    private

      def post(url, params = {}, headers = {})
        response = self.class.post(url, query: params, headers: headers.merge(auth_header))
        evaluate_response(response)
      end

      def auth_header
        { 'Authorization' => "Bearer #{credentials}" }
      end

      def credentials
        Base64.urlsafe_encode64(@access_token)
      end

      def evaluate_response(response)
        response_body = JSON.parse(response.body)
        
        case response.code
        when 201
          response_body
        when 400
          raise Rumour::Errors::RequestError.new response_body['message']
        when 401
          raise Rumour::Errors::AuthenticationError.new response_body['message']
        when 500
          raise Rumour::Errors::AuthenticationError.new response_body['message']
        end
      end

      def intercept_tm_recipient
        Rumour.configuration.intercept_text_message_recipient
      end

      def intercept_pn_recipients
        Rumour.configuration.intercept_push_notification_recipients
      end
  end
end
