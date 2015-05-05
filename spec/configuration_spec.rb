require 'spec_helper'

RSpec.describe Rumour do
  describe '.configure' do
    before do
      described_class.configure do |config|
        config.api_key = 'some_api_key'
        config.access_token = 'some_access_token'
        config.intercept_text_message_recipient = '+14108675309'
        config.intercept_push_notification_recipients = ['android::push_recipient']
      end
    end

    it 'assigns the authentication credentials' do
      expect(described_class.configuration.api_key).to eq('some_api_key')
      expect(described_class.configuration.access_token).to eq('some_access_token')
      expect(described_class.configuration.intercept_text_message_recipient).to eq('+14108675309')
      expect(described_class.configuration.intercept_push_notification_recipients).to eq(['android::push_recipient'])
    end
  end
end
