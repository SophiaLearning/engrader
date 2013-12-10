module Engrader::Http
  class Request
    INTERFACE = %w(params apitask)

    def self.response(*args)
      new(*args).response_body
    end

    def response
      Base.post Engrader::Config.api_url, body: {
        apitask: apitask,
        apikey: Engrader::Config.apikey
      }.merge(params)
    end

    def response_body
      response.to_h
    end

    INTERFACE.each do |method_name|
      define_method(method_name) { raise NotImplementedError }
    end

    private

    def ses
      Session.ses
    end
  end
end

require 'engrader/http/request/user_login'
require 'engrader/http/request/default'
require 'engrader/http/request/app_data_post'
require 'engrader/http/request/app'
require 'engrader/http/request/admin_districts'
require 'engrader/http/request/district_schools'
require 'engrader/http/request/school_base'
require 'engrader/http/request/school_gps'
require 'engrader/http/request/school_teachers'
