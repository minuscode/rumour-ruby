module Rumour
  class Configuration
    CONFIGURABLE_ATTRIBUTES = [
      :api_key,
      :access_token
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
