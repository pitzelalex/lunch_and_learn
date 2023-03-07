require 'rails_helper'

RSpec.describe Image do
  describe '#initialize' do
    it 'exists and has attributes' do
      image_data = JSON.parse(File.read('spec/fixtures/image_fixture.json'), symbolize_names: true)

      image = Image.new(image_data)

      expect(image.alt_tag).to eq('aerial photo of city during golden hour')
      expect(image.url).to eq('https://images.unsplash.com/photo-1517935706615-2717063c2225?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MTk1MzZ8MHwxfHNlYXJjaHwxfHxjYW5hZGF8ZW58MHx8fHwxNjc4MjA0NTY4&ixlib=rb-4.0.3&q=80')
    end
  end
end
