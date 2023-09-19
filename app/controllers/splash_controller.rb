class SplashController < ApplicationController
    def index
        
    end

    def redirect_to_login
        
        if user_signed_in?
            redirect_to categories_path
        else
            redirect_to new_user_session_path
        end
    end
end
