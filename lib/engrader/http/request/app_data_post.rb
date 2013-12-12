module Engrader::Http
  class Request::AppDataPost < Request
    def initialize(args)
      raise ArgumentError unless args.is_a? Hash
      @appsesid, @data = args[:appsesid], args[:data]
      raise ArgumentError unless @appsesid.is_a?(String) && @data.is_a?(Hash)
    end

    def apitask
      'app-data-post'
    end

    def params
      { appsesid: @appsesid, data: JSON.generate(@data) }
    end
  end
end
