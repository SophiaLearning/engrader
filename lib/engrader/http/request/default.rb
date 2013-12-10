#You can create any Api request with this default request.
#Pay attention you must build FULL request body by yourself
#only apikey and api url will be automaticaly added
module Engrader::Http
  class Request::Default < Request
    attr_reader :apitask, :params

    def initialize(args)
      raise ArgumentError if !args.is_a?(Hash) || args[:apitask].nil?
      @apitask = args[:apitask]
      @params  = args.reject { |k, v| k == :apitask }
    end
  end
end
