require 'rails_helper'

RSpec.describe TouristSight do
  describe '#initialize' do
    it 'exists and has attributes' do
      sight_data = JSON.parse(File.read('spec/fixtures/sight_fixture.json'), symbolize_names: true)

      sight = TouristSight.new(sight_data)

      expect(sight).to be_a TouristSight
      expect(sight.id).to be nil
      expect(sight.name).to eq('Royal Canadian Mint')
      expect(sight.place_id).to eq('5178ea2272c0ec52c059d4d65edb37b74640f00102f901e093160400000000920313526f79616c2043616e616469616e204d696e74')
    end
  end
end
