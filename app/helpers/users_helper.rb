module UsersHelper
    private
    def user_params
        params.require(:user).permit( :user_name, :email, :password, :password_confirmation)
    end
end
