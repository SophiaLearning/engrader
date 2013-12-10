module Engrader::Http
  class Session
    class << self

      #Pay attention where we store ses.
      #It means that if you use Engrader in controller
      #session would be initialized for every worker.
      #(For every ruby thread)
      def ses=(ses)
        Thread.current[:engrader_api_ses] = ses
      end

      def ses
        Thread.current[:engrader_api_ses] ||= new.ses
      end
    end

    #supply it with usr and pwd
    #or configure usr and pwd with Engrader::Config
    #or set ses directly with Engrader::Http::Session.ses.=
    def initialize(usr = nil, pwd = nil)
      @usr, @pwd = usr, pwd
    end

    def ses
      @ses ||= get_ses["engrade"]["values"]["ses"]
    end

    private

    def get_ses
      Engrader::Http::Request::UserLogin.response usr: @usr, pwd: @pwd
    end
  end
end
