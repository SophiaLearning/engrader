module HttpartyMock
  def post(*args)
    posted << args
    response
  end

  def posted
    @posted ||= []
  end

  def response_args=(args)
    @response_args = args
  end

  def response
    Response.new @response_args || {}
  end

  class Response
    def initialize(args = {})
      @args = args
    end

    def parsed_response
      { "engrade" => { "success" => "true" } }.merge(@args)
    end
  end
end
