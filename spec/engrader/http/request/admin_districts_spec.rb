require 'spec_helper'

describe Engrader::Http::Request::AdminDistricts, type: :with_mock_ses do
  let(:admin_districts) { Engrader::Http::Request::AdminDistricts.new }

  it 'must be instance of Request' do
    admin_districts.should be_an(Engrader::Http::Request)
  end

  describe '#apitask' do
    specify{ admin_districts.apitask.should == 'admin-districts' }
  end

  describe 'params' do
    specify { admin_districts.params.should == { ses: 'ses' } }
  end
end
