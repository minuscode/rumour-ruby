require 'spec_helper'

RSpec.describe Rumour do
  describe '.configure' do
    before do
      described_class.configure do |config|
        config.api_key = 'some_api_key'
        config.access_token = 'some_access_token'
      end
    end

    it 'assigns the authentication credentials' do
      expect(described_class.configuration.api_key).to eq('some_api_key')
      expect(described_class.configuration.access_token).to eq('some_access_token')
    end
  end
end
