# frozen_string_literal: true

ENV['APP_ENV'] = 'development'

require 'sinatra'
require 'sinatra/reloader' if development?
require './version'
require './services/google_service'

get '/' do
  'Hello World!'
end

get '/status' do
  {
    name: 'Google Drive Reader',
    version: VERSION
  }.to_s
end

get '/data' do
  connect_to_google
  'All Good!'
end

private

def connect_to_google
  GoogleService.authenticate_user
  GoogleService.get_files
end
