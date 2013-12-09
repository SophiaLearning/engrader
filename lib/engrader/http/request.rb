module Engrader::Http
  class Request
    INTERFACE = %w(params apitask)

    def self.response(*args)
      new(*args).response
    end

    def response
      Base.post Engrader::Config.api_url, { apitask: apitask }.merge(params)
    end

    INTERFACE.each do |method_name|
      define_method method_name do
        raise NotImplementedError
      end
    end
  end
end

require 'engrader/http/request/login'
