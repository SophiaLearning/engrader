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

  context do
    before :each do
      request.stub apitask: 'the-task', params: { additional: 'params' }
    end

    describe '#response' do
      it 'make response' do
        request.response
        Engrader::Http::Base.posted.should include(
          [
            Engrader::Config.api_url,
            {
              body: { apitask: 'the-task', additional: 'params', apikey: Engrader::Config.apikey },
              headers: {}
            }
          ]
        )
      end

      it 'returns repsonse object' do
        request.response.should be_a(HttpartyMock::Response)
      end
    end

    describe 'response_body' do
      it 'calls for #response' do
        request.should_receive(:response).and_return double.as_null_object
        request.response_body
      end

      it 'convert response to hash' do
        request.response_body.should == request.response.to_h
      end
    end
  end

  describe '#ses' do
    it 'calls for Session.ses' do
      Engrader::Http::Session.should_receive :ses
      request.__send__ :ses
    end
  end
end
