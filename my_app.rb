# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello World!'
end

get '/status' do
  response_obj = {
    version: '1.0',
    name: 'Google Drive Reader',
    env: 'development'
  }

  response_obj.to_s
end
