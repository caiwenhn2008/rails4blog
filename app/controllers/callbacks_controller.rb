class CallbacksController < Devise::OmniauthCallbacksController
    def github
        processResponse
    end

    def weibo
        processResponse
    end

    def qq_connect
        processResponse
    end

    def processResponse
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

    def sign_out
        sign_out @user
    end
end