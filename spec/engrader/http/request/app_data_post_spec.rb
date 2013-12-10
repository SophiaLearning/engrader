require 'spec_helper'

describe Engrader::Http::Request::AppDataPost do
  let(:appsesid)      { 'appsesid' }
  let(:data)          { { data: 'some-data-to-post' } }
  let(:app_data_post) { Engrader::Http::Request::AppDataPost.new appsesid: appsesid, data: data }

  describe 'initialize' do
    context 'raises ArgumentError when' do
      it 'suplied with not hash' do
        expect do
          Engrader::Http::Request::AppDataPost.new 'wrong'
        end.to raise_error(ArgumentError)
      end

      it 'appsesid is not string' do
        expect do
          Engrader::Http::Request::AppDataPost.new appsesid: 1, data: {}
        end.to raise_error(ArgumentError)
      end

      it 'data is not hash' do
        expect do
          Engrader::Http::Request::AppDataPost.new appsesid: 1, data: []
        end.to raise_error(ArgumentError)
      end
    end

    context 'assigns' do
      it '@appsesid' do
        app_data_post.instance_variable_get('@appsesid').should == appsesid
      end

      it '@data' do
        app_data_post.instance_variable_get('@data').should == data
      end
    end
  end

  describe '#apitask' do
    specify { app_data_post.apitask.should == 'app-data-post' }
  end

  describe '#params', type: :with_mock_ses do
    specify do
      app_data_post.params.should == {
        appsesid: appsesid,
        data: data
      }
    end
  end
end
