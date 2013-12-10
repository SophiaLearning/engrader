require 'spec_helper'

describe Engrader::Http::Request::Default do
  def default(*args)
    Engrader::Http::Request::Default.new(*args)
  end

  it 'must be an onstance of Request' do
    default(apitask: 'test').should be_an(Engrader::Http::Request)
  end

  describe '#initialize' do
    it 'raise exception when called without hash' do
      expect { default 'wrong' }.to raise_error(ArgumentError)
    end

    it 'raise exception when called without apitask' do
      expect { default params: 'some-params' }.to raise_error(ArgumentError)
    end

    context 'assigns' do
      let(:def_req) { default apitask: 'apitask', other: 'other' }

      it '@apitask' do
        def_req.apitask.should == 'apitask'
      end

      it '@params' do
        def_req.params.should == { other: 'other' }
      end
    end
  end
end
