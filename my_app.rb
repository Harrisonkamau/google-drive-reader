# frozen_string_literal: true

ENV['APP_ENV'] = 'development'

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello World!'
end

get '/status' do
  {
    name: 'Google Drive Reader',
    version: '1.0'
  }.to_s
end
