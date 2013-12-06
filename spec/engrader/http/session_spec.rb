require 'spec_helper'

describe Engrader::Http::Session do
  let(:session) { Engrader::Http::Session.new }

  describe '#ses' do
    before { session.stub get_ses: 'ses-value' }

    it 'calls for #get_ses' do
      session.should_receive(:get_ses).and_return 'ses-value'
      session.ses
    end

    it 'memoize ses' do
      result = session.ses
      session.instance_variable_get('@ses').should == result
    end
  end

  describe '#get_ses' do
    it 'get response from correct request' do
      Engrader::Http::Request::Login.should_receive(:response)
      session.__send__ :get_ses
    end

    it 'returns ses from response' do
    end
  end
end
