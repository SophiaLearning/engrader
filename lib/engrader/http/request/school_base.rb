module Engrader::Http
  class Request::SchoolBase < Request
    def initialize(args)
      raise ArgumentError if !args.is_a?(Hash) || args[:schoolid].nil?
      @schoolid = args[:schoolid]
    end

    def params
      { schoolid: @schoolid, ses: ses }
    end
  end
end
