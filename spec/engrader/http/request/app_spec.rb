require 'spec_helper'

describe Engrader::Http::Request::App, type: :with_mock_ses do
  let(:app) { Engrader::Http::Request::App.new }

  it 'must be an instance of Request' do
    app.should be_an(Engrader::Http::Request)
  end

  describe '#apitask' do
    specify { app.apitask.should == 'app' }
  end

  describe '#params' do
    specify { app.params.should == { ses: 'ses' } }
  end
end
