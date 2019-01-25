require 'test_helper'
require 'circuitbox'

describe VertexClient::Configuration do
  after do
    VertexClient.reconfigure!
  end

  it 'has a trusted id' do
    VertexClient.configuration.trusted_id = 'trusted-id'
    assert_equal 'trusted-id', VertexClient.configuration.trusted_id
    VertexClient.reconfigure!
  end

  it 'has a soap_api, and adds a trailing slash to it' do
    VertexClient.configuration.soap_api = 'http://service.example.com'
    assert_equal 'http://service.example.com/', VertexClient.configuration.soap_api
    VertexClient.reconfigure!
  end

  describe 'circuit_config' do
    before do
      VertexClient.reconfigure!
    end

    it 'is an accessible attribute' do
      VertexClient.configuration.circuit_config = { test: :ok }
      assert_equal :ok, VertexClient.configuration.circuit_config[:test]
    end

    it 'is nil if nothing is provided' do
      assert_nil VertexClient::Configuration.new.circuit_config
    end

    it 'merges in defaults from CIRCUIT_CONFIG' do
      VertexClient.reconfigure! do |config|
        config.circuit_config = { sleep_window: 300 }
      end

      assert_equal VertexClient.circuit.service, 'vertex_client'
      config_defaults = VertexClient::Configuration::CIRCUIT_CONFIG.reject{|k,_| k == :logger }
      config_defaults.each_pair do |key, value|
        assert_equal value, VertexClient.circuit.circuit_options[key]
      end
    end
  end
end
