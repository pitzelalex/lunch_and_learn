require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :favorites }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'class methods' do
    describe '#generate_key' do
      it 'generates an api_key' do
        expect(User.generate_key).to be_a String
        expect(User.generate_key.length).to eq(22)
      end
    end
  end
end
