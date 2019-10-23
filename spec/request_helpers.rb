module RequestHelpers
    def user_signup_url
        '/api/v1/users'
    end

    def request_json
        JSON.parse(response.body)
    end

    def  valid_params
        {
            "user":{
            "user_name": "Jacob",
            "email": "jake@jake.jake",
            "password": "jakejake",
            "password_confirmation":"jakejake"
            }
        }
    end

    def invalid_params
        {
        "user":{
            "user_name": "",
            "email": "wali@jake.jake",
            "password": "jakejake",
            "password_confirmation":"jakejake"
        }
        }
     end
end
