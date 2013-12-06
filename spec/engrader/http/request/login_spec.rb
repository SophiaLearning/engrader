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
end
