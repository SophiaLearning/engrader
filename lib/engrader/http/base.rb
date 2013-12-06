module Engrader::Http
  class Base
    include HTTParty

    def self.verify_response
      yield.tap do |response|
        if !response.parsed_response["engrade"].is_a?(Hash) ||
          response.parsed_response["engrade"]["success"] != 'true'
          raise Engrader::Errors::UnsuccessfullRequest
        end
      end
    end
  end
end
