class Api::V1::UsersController < ApplicationController
    def index
        render( json: {'status' => 'ok'})
    end
end
