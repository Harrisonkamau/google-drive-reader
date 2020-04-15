# frozen_string_literal: true

ENV['APP_ENV'] = 'development'

require 'sinatra'
require 'sinatra/reloader' if development?
require './version'

get '/' do
  'Hello World!'
end

get '/status' do
  {
    name: 'Google Drive Reader',
    version: VERSION
  }.to_s
end
