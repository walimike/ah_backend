require 'swagger_helper'

describe 'User API' do

  path '/api/v1/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user_name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'username', 'email','password' ]
      }

      response '201', 'user created' do
            it "creates a new user" do
              expect { post user_signup_url, params: valid_params }.to change(User, :count).by(+1)
              expect(response).to have_http_status :created
            end
      end

      response '422', 'invalid request' do
         it "rejects a user with invalid params" do
            post user_signup_url, params: invalid_params
            expect(request_json['errors']).to eql("user_name" => ["can't be blank"])
          end
      end
    end
  end
end