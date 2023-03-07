require 'rails_helper'

RSpec.describe Video do
  describe '#initialize' do
    it 'exists and has attributes' do
      video_data = JSON.parse(File.read('spec/fixtures/video_fixture.json'), symbolize_names: true)

      video = Video.new(video_data)

      expect(video).to be_a Video
      expect(video.title).to eq('A Super Quick History of Canada')
      expect(video.youtube_video_id).to eq('e_okM7Mig6s')
    end
  end
end
