require 'rails_helper'

RSpec.describe LearningResource do
  describe '#initialize' do
    it 'exists and has attributes' do
      video_data = JSON.parse(File.read('spec/fixtures/video_fixture.json'), symbolize_names: true)
      image_data = JSON.parse(File.read('spec/fixtures/image_fixture.json'), symbolize_names: true)
      video = Video.new(video_data)
      image1 = Image.new(image_data)
      image2 = Image.new(image_data)

      resource = LearningResource.new(video, [image1, image2], 'Canada')

      expect(resource).to be_a LearningResource
      expect(resource.id).to be nil
      expect(resource.country).to eq('Canada')
      expect(resource.video).to eq(video)
      expect(resource.images.count).to eq(2)
      expect(resource.images).to eq([image1, image2])
    end
  end
end
