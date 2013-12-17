# Engrader
Ruby wrapper for Engrader API
## Installation
Add this line to your application's Gemfile:
    gem 'engrader', git: 'git://github.com/SophiaLearning/engrader'
And then execute:

    $ bundle
## Usage
  Create engrader initializer and configure following properties of the gem:
  ```ruby
    Engrader::Config.apikey     = 'your apikey'
    Engrader::Config.usr        = 'engrader user'
    Engrader::Config.pwd        = 'engrader password'
    Engrader::Config.api_url    = 'url for api calls'
    Engrader::Config.debug_mode = 'do not raise exception when response is unsuccessfull'
    Engrader::Config.referer    = 'http://referer'
  ```

  Then run requests you needed:

  ```ruby
    Engrader.app
    Engrader.admin_districts
    #and etc.
  ```
