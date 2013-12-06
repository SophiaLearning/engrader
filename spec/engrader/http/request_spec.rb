require 'spec_helper'

describe Engrader::Http::Request do
  let(:request) { Engrader::Http::Request.new }

  describe 'interface' do
    Engrader::Http::Request::INTERFACE.each do |method_name|
      it method_name do
        expect { request.send method_name }.to raise_error(NotImplementedError)
      end
    end
  end

  describe '#response' do
    before :each do
      request.stub apitask: 'the-task', params: { additional: 'params' }
    end

    it 'make response' do
      request.response
      Engrader::Http::Base.posted.should include(
        [Engrader::Config.api_url, { apitask: 'the-task', additional: 'params' }]
      )
    end

    it 'returns repsonse object' do
      request.response.should be_a(HttpartyMock::Response)
    end
  end
end
