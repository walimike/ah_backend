require 'rails_helper'
require 'spec_helper'

RSpec.describe User do
    describe 'validations' do
        # use shoulder_matchers to run these tests
        it{ is_expected.to validate_presence_of :name }
        it{ is_expected.to validate_presence_of :email }
        it{ is_expected.to validate_uniqueness_of :email }
    end
end