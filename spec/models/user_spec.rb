require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'class methods' do
    describe '#generate_key' do
      it 'generates an api_key' do
        expect(User.generate_key).to be_a String
        expect(User.generate_key.length).to eq(22)
      end
    end
  end
end
