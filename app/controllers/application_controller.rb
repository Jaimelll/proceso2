class ApplicationController < ActionController::Base
    def access_denied(exception)
        redirect_to destroy_admin_user_session_path, :alert => exception.message
   end
end
