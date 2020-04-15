# frozen_string_literal: true

require 'google_drive'
require 'json'

FileNotFoundError = Class.new(StandardError) do
  def message
    'Missing "client_secrets.json" file at the root of the app'
  end
end

class GoogleService
  class << self
    def authenticate_user
      puts '[FROM GOOGLE >>] Hang tight as we authorize you'
      session
      puts 'Authorization successful!'
    end

    def get_files
      files = session.files
      puts "FIRST FILE: #{files[0]}"

      files
    end

    def session
      GoogleDrive::Session.from_config(secrets_filename)
    end


    def secrets_filename
      root_dir = File.expand_path('.')
      file = File.join(root_dir, 'client_secrets.json')
      raise FileNotFoundError unless File.exists?(file)

      file
    end
  end
end
