class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  after_action :set_cors

  def set_cors
    headers['Access-Control-Allow-Origin'] = 'http://localhost:8000'
    headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE, OPTIONS'
  end
end
