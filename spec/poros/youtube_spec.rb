require 'rails_helper'

RSpec.describe YoutubeVideo do
  describe '#initialize' do
    it 'exists and has attributes' do
      video_data = JSON.parse(File.read('spec/fixtures/video_fixture.json'), symbolize_names: true)

      video = YoutubeVideo.new(video_data)

      expect(video).to be_a YoutubeVideo
      expect(video.id).to be nil
      expect(video.title).to eq('A Super Quick History of Canada')
      expect(video.youtube_video_id).to eq('e_okM7Mig6s')
    end
  end
end
