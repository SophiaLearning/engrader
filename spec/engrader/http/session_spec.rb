require 'spec_helper'

describe Engrader::Http::Session do
  it 'must be an Engrader::Http::Base' do
    subject.should be_an(Engrader::Http::Base)
  end

  describe '#ses' do
    let(:pwd)     { 'password' }
    let(:usr)     { 'Johndoe' }
    let(:apikey)  { 'apikey' }
    let(:api_url) { 'http://test.test' }


    before :each do
      Engrader::Config.instance_variable_set '@config', {
        'apikey' => apikey, 'api_url' => api_url, 'usr' => usr, 'pwd' => pwd,
      }
    end
    after { Engrader::Config.instance_variable_set '@config', {} }

    it 'gets ses from engrade' do
      Engrader::Http::Session.posted.should include([
        Engrader::Config.api_url,
        { apitask: 'login', usr: usr, pwd: pwd, apikey: apikey }
      ])
    end
  end
end
