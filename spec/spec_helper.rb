require 'engrader'
require 'pry'
module Engrader::Http
  class Base
    class << self
      def post(*args)
        posted << args
        response
      end

      def posted
        @posted ||= []
      end

      def response_args=(args)
        @response_args = args
      end

      def response
        HttpartyMock::Response.new @response_args || {}
      end
    end

  end
end

module HttpartyMock
  class Response
    def initialize(args = {})
      @args = args
    end

    def to_h
      { "engrade" => { "success" => "true" } }.merge(@args)
    end
  end
end
RSpec.configure do |config|
  config.before :each, type: 'with_mock_ses' do
    Engrader::Http::Session.ses = 'ses'
  end

  config.after :each, type: 'with_mock_ses' do
    Engrader::Http::Session.ses = nil
  end
end
