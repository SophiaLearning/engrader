module Engrader::Http
  class Base
    class << self
      #The "REST" engrade's api supports olny one http verb ^^
      def post(*args)
        verify_response { HTTParty.post(*args) }
      end

      private

      def verify_response
        yield.tap do |response|
          unless Engrader::Config.debug_mode
            if !response.to_h["engrade"].is_a?(Hash) ||
              response.to_h["engrade"]["success"] != 'true'

              #TODO add logging here
              raise Engrader::Errors::UnsuccessfullRequest
            end
          end
        end
      end
    end
  end
end
