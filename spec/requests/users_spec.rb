require 'rails_helper'

RSpec.describe 'test user route' do
    describe 'GET /api/v1/' do
        it 'checks if api root is working' do
            get(user_signup_url)
            expect(request_json['status']).to eql('ok')
            expect(response.status).to eql(200)
        end
    end

    describe "POST /api/v1/users" do
        context "with valid parameters" do    
          it "creates a new user" do
            expect { post user_signup_url, params: valid_params }.to change(User, :count).by(+1)
            expect(response).to have_http_status :created
          end
    
          it "rejects a user with invalid params" do
            post user_signup_url, params: invalid_params
            expect(request_json['errors']).to eql("user_name" => ["can't be blank"])
          end
        end
    end

    describe "POST /api/v1/auth/login" do
      context "with valid parameters" do 
        it "generates a token with registered user " do
          expect { post user_signup_url, params: valid_params }.to change(User, :count).by(+1)
          post '/api/v1/auth/login', params: valid_params 
          expect { JWT.decode(request_json['token'], key) }.to_not raise_error(JWT::DecodeError)
        end

        it "returns an error message with unregistered user" do
          post '/api/v1/auth/login', params: valid_params 
          expect(request_json['errors']).to eql("unauthorized")
        end
      end
    end
end
