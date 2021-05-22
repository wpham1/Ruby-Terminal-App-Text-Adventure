require './lib/hub'  #=> add this


describe Hub do
    describe "#location" do
        it "returns the names of two locations: shop and forest" do
            hub = Hub.new
            expect(hub.location.place)).to eql("Shop")
        end
    end
end