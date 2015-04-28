module Rumour
  class Configuration
    CONFIGURABLE_ATTRIBUTES = [
      :api_key,
      :access_token,
      :intercept_text_message_recipient,
      :intercept_push_notification_recipient
    ]

    attr_accessor *CONFIGURABLE_ATTRIBUTES

    def initialize
      # Nothing to do
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
