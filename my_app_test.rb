# frozen_string_literal: true

require './my_app'
require 'test/unit'
require 'rack/test'

set :environment, :test

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_returns_hello_world
    get '/'

    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end

  def test_status_returns_app_status
    response_obj = {
      name: 'Google Drive Reader',
      version: '1.0'
    }.to_s

    get '/status'

    assert last_response.ok?
    assert_equal response_obj, last_response.body
  end
end
