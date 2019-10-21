require 'rails_helper'

RSpec.describe 'test user route' do
    describe 'GET /api/v1/' do
        it 'checks if api root is working' do
            get('/api/v1/users')
            json = JSON.parse(response.body)
            expect(json['status']).to eql('ok')
            expect(response.status).to eql(200)
        end
    end
end