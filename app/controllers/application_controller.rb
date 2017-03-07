class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if Person.all.count == 0
        # If no person exists, we allow unauthenticated access
        true
      else
        # Find person and check password
        Person.find_by(name: username).try(:authenticate, password)
      end
    end
  end
end
