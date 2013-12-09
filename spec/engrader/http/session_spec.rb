require 'spec_helper'

describe Engrader::Http::Session do
  let(:manual_session) { Engrader::Http::Session.new 'manual-usr', 'manual-pwd' }
  let(:session)        { Engrader::Http::Session.new }

  describe '#initialize' do
    context 'with manual usr and pwd' do
      describe '#assigns' do
        it '@usr' do
          manual_session.instance_variable_get('@usr').should == 'manual-usr'
        end

        it '@pwd' do
          manual_session.instance_variable_get('@pwd').should == 'manual-pwd'
        end
      end
    end
  end

  context 'class methods' do
    after { Thread.current[:engrader_api_ses] = nil }

    describe '.ses=' do
      it 'writes ses to current thread local variable' do
        Engrader::Http::Session.ses = 'new-ses-key'
        Thread.current[:engrader_api_ses].should == 'new-ses-key'
      end
    end

    describe '.ses' do
      it 'returns ses from current thread' do
        Thread.current[:engrader_api_ses] = 'new-ses-key-2'
        Engrader::Http::Session.ses.should == 'new-ses-key-2'
      end

      it 'init new session if needed' do
        mock_session = double
        mock_session.should_receive(:ses).and_return 'new-ses-key-3'
        Engrader::Http::Session.should_receive(:new).and_return mock_session
        Engrader::Http::Session.ses.should == 'new-ses-key-3'
        Thread.current[:engrader_api_ses].should == 'new-ses-key-3'
      end
    end
  end

  describe '#ses=' do
    it 'writes @ses' do
      session.ses = 'ses-key'
      session.instance_variable_get('@ses').should == 'ses-key'
    end
  end

  describe '#ses' do
    before { session.stub get_ses: double(to_h: {'engrade' => { 'values' => 'ses' }}) }

    it 'calls for #get_ses' do
      session.should_receive(:get_ses).and_return double(to_h: {'engrade' => { 'values' => 'ses' }})
      session.ses
    end

    it 'memoize ses' do
      result = session.ses
      session.instance_variable_get('@ses').should == result
    end
  end

  describe '#get_ses' do
    context 'with configurable usr and pwd' do
      it 'gets response from correct request' do
        Engrader::Http::Request::Login.should_receive(:response).with nil, nil
        session.__send__ :get_ses
      end
    end

    context 'with manual usr and pwd' do
      it 'gets response correctly' do
        Engrader::Http::Request::Login.should_receive(:response).with 'manual-usr', 'manual-pwd'
        manual_session.__send__ :get_ses
      end
    end

    it 'returns ses from response' do
      Engrader::Http::Base.response_args = { "engrade" => { "success" => "true", "values" => { "ses" => 'ses' } } }
      session.__send__(:get_ses).should be_a(HttpartyMock::Response)
    end
  end
end
