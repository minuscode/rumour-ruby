require 'spec_helper'

Rumour.configure do |config|
  config.access_token = '12345'
end

RSpec.describe Rumour::Client do
  let(:rumour_client) do
    described_class.new('12345', '12345')
  end

  describe '.new and credentials' do
    it 'sets the authentication credentials' do
      rumour_client = described_class.new('13b91294f69c5e6046274d249911c275e21e013e')

      expect(rumour_client.access_token).to eq('13b91294f69c5e6046274d249911c275e21e013e')
    end

    it 'fallbacks to the configuration credentials' do
      rumour_client = described_class.new

      expect(rumour_client.access_token).to eq('12345')
    end
  end

  describe '.send_text_message' do
    it 'create and retrieve a new message as a hash' do
      rumour_client = described_class.new('13b91294f69c5e6046274d249911c275e21e013e')
      text_messages = rumour_client.send_text_message('+14108675309', '+14108675309', 'Hello from rumour-ruby!')

      expect(text_messages[0]['id']).to_not be_nil
    end
  end
end
