require 'spec_helper'

describe Engrader::Http::Base do
  it 'has httparty mixin' do
    subject.should be_a(HTTParty)
  end

  describe '.verify_response' do
    after { Engrader::Http::Base.response_args = nil }

    it 'raise error when response was not success' do
      Engrader::Http::Base.response_args = { "engrade" => { "success" => "false" } }
      expect do
        Engrader::Http::Base.verify_response { Engrader::Http::Base.post }
      end.to raise_error(Engrader::Errors::UnsuccessfullRequest)
    end

    it 'returns response when response was success' do
      Engrader::Http::Base.verify_response { Engrader::Http::Base.post }.should be_a(HttpartyMock::Response)
    end
  end
end
