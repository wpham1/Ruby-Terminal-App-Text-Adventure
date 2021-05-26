require 'hub'  #=> add this
require 'character'

Rspec.describe Shop do
    it 'creates a student class' do
      shop = Shop.new
      expect(shop).to be_kind_of(Shop)
    end
  end