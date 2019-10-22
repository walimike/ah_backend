module RequestHelpers
    def user_signup_url
        '/api/v1/users'
    end

    def request_json
        JSON.parse(response.body)
    end
end