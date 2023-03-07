require 'rails_helper'

RSpec.describe YoutubeFacade do
  describe '#country' do
    it 'returns a Youtube Video Object', :vcr do
      video = YoutubeFacade.get('thailand')

      expect(video).to be_a Video
    end
  end
end
