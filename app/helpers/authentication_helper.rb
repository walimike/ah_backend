module AuthenticationHelper
    private
    def login_params
        params.require(:user).permit( :user_name, :email, :password)
    end
end