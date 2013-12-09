require 'spec_helper'

describe Engrader::Http::Request::Login do
  let(:login) { Engrader::Http::Request::Login.new }

  it 'must be a Rquest' do
    login.should be_a(Engrader::Http::Request)
  end

  describe '#apitask' do
    it 'returns login' do
      login.apitask.should == 'login'
    end
  end

  describe '#params' do
    specify do
      login.params.should == {
        pwd: Engrader::Config.pwd,
        usr: Engrader::Config.usr,
        apikey: Engrader::Config.apikey
      }
    end
  end

  context 'when initialized with usr and pwd' do
    let(:login) { Engrader::Http::Request::Login.new 'manual-usr', 'manual-pwd' }

    describe 'assigns' do
      it '@usr' do
        login.instance_variable_get('@usr').should == 'manual-usr'
      end

      it '@pwd' do
        login.instance_variable_get('@pwd').should == 'manual-pwd'
      end
    end

    describe '#params' do
      specify do
        login.params.should == {
          pwd: 'manual-usr',
          usr: 'manual-pwd',
          apikey: Engrader::Config.apikey
        }
      end
    end
  end

  describe '#validate_response' do
    specify do
      expect do
        login.__send__(:validate_response) do
          double to_h: { 'engrade' => { 'values' => { 'ses' => 'ses' } } }
        end
      end.to_not raise_error
    end

    specify do
      expect do
        login.__send__(:validate_response) do
          double to_h: { 'engrade' => {} }
        end
      end.to raise_error(Engrader::Http::Request::Login::Invalid)
    end

    specify do
      expect do
        login.__send__(:validate_response) do
          double to_h: { 'engrade' => { 'values' => {} }}
        end
      end.to raise_error(Engrader::Http::Request::Login::Invalid)
    end
  end
end
