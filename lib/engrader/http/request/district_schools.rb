module Engrader::Http
  class Request::DistrictSchools < Request
    def initialize(args)
      raise ArgumentError if !args.is_a?(Hash) || args[:districtid].nil?
      @districtid = args[:districtid]
    end

    def apitask
      'district-schools'
    end

    def params
      { ses: ses, districtid: @districtid }
    end
  end
end
