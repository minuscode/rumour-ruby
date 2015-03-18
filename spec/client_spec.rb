require 'spec_helper'

RUMOUR_TEST_ACCESS_TOKEN = '13b91294f69c5e6046274d249911c275e21e013e'
TWILIO_TEST_SENDER_NUMBER = '+15005550006'
TWILIO_TEST_RECIPIENT_NUMBER = '+14108675309'

Rumour.configure do |config|
  config.access_token = 'CONFIGURED_ACCESS_TOKEN'
end

RSpec.describe Rumour::Client do

  describe '.new' do
    it 'sets the authentication credentials' do
      rumour_client = Rumour::Client.new(RUMOUR_TEST_ACCESS_TOKEN)

      expect(rumour_client.access_token).to eq(RUMOUR_TEST_ACCESS_TOKEN)
    end

    it 'falls back to the configuration credentials' do
      rumour_client = Rumour::Client.new

      expect(rumour_client.access_token).to eq('CONFIGURED_ACCESS_TOKEN')
    end

    it 'raises an AuthenticationError if no access_token is supplied' do
      Rumour.configure { |config| config.access_token = nil }
      expect { rumour_client = Rumour::Client.new }.to raise_error(Rumour::Errors::AuthenticationError)
      Rumour.configure { |config| config.access_token = 'CONFIGURED_ACCESS_TOKEN' }
    end
  end

  describe '.send_text_message with valid data' do
    it 'creates and retrieves a new message as a hash' do
      rumour_client = Rumour::Client.new(RUMOUR_TEST_ACCESS_TOKEN)
      text_message = rumour_client.send_text_message(TWILIO_TEST_SENDER_NUMBER, TWILIO_TEST_RECIPIENT_NUMBER, 'Hello from rumour-ruby!')

      expect(text_message['id']).to_not be_nil
    end
  end

  describe '.send_text_message with invalid data' do
    it 'raises a RequestError' do
      rumour_client = Rumour::Client.new(RUMOUR_TEST_ACCESS_TOKEN)

      expect {
        text_message = rumour_client.send_text_message('+351123456789', '+351123456789', 'Hello from rumour-ruby!')        
      }.to raise_error(Rumour::Errors::RequestError)
    end
  end
end
