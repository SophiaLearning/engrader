require 'engrader'
require 'pry'
require 'support/httparty_mock'
Engrader::Http::Base.extend  HttpartyMock
