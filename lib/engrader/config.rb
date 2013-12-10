module Engrader
  class Config
    CONFIGURABLE = %w(apikey usr pwd api_url debug_mode)
    @config = {}

    class << self
      CONFIGURABLE.each do |option|
        define_method option do
          @config[option]
        end

        define_method "#{option}=" do |value|
          @config[option] = value
        end
      end
    end
  end
end
