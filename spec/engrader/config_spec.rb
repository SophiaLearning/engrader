require 'spec_helper'

describe Engrader::Config do
  after(:each) { Engrader::Config.instance_variable_set '@config', {} }

  it 'has correct setter' do
    Engrader::Config.apikey = 'iddqd'
    Engrader::Config.instance_variable_get('@config').should == { 'apikey' => 'iddqd' }
  end

  it 'has correct getter' do
    Engrader::Config.apikey.should be_nil
    Engrader::Config.instance_variable_set('@config', { 'apikey' => 'iddqd' })
    Engrader::Config.apikey.should == 'iddqd'
  end
end
