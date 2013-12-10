module Engrader::Http
  class Request::Default < Request
    attr_reader :apitask, :params

    def initialize(args)
      raise ArgumentError if !args.is_a?(Hash) || args[:apitask].nil?
      @apitask = args[:apitask]
      @params  = args.reject { |k, v| k == :apitask }.merge ses: 'ses'
    end
  end
end
